--- 
wordpress_id: 209
title: EJB3 Comments
wordpress_url: http://www.tiagoluchini.eu/2007/06/11/ejb3-comments/
layout: post
---
<span lang="EN-GB">From time to time, I am one of those lucky professionals having the chance of working with state-of-the-art and break-through technologies. <o:p></o:p></span>

<span lang="EN-GB">In my current project, the customer has explicitly chosen to explore the well-marketed capabilities of the new EJB3.0 specification and its open-sourced implementation from JBoss.<o:p></o:p></span>

<span lang="EN-GB">After some really deep hands-on work with this environment, I have brought up 10 points that annoy me and that should be addressed in future releases. But before diving into that, I must confess that the EJB3.0 is a huge step forward from its predecessor. I finally have the feeling that I am designing and implementing things the way they should be (or at least it is getting pretty close). <o:p></o:p></span>

<span lang="EN-GB">Designing and implementing for EJB3.0 is really fun. You can easily see your business model reflected in the Entity Beans and Session Beans and you know, deep inside, that you will not need to implement and maintain a bunch of auxiliary classes to glue everything together. This is the nice part of it!<o:p></o:p></span>

<span lang="EN-GB">Also, the annotation-cantered style for practically everything is just wonderful: everything is where it should be AND you still have the possibility of overriding some configuration with xml descriptor files. It is a very well-balanced solution.<o:p></o:p></span>

<span lang="EN-GB">If you put your hands onto writing EQL and using the simple but yet very powerful constructor expression, your daily routine is greatly simplified.<o:p></o:p></span>

<span lang="EN-GB">Having said all these nice things, let's check the bad facts. <o:p></o:p></span>
<p class="MsoNormal"><span lang="EN-GB"><strong>1) @EJB injection not fully implemented on JBoss 4.0.5 with EJB3 RC9</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">the @EJB annotation is not fully implemented on JBoss 4.0.5 with EJB3 RC9. Application clients (servlets and JSPs included) cannot have an EJB Session Bean automatically injected on an annotated member with @EJB.<o:p></o:p></span></li>
	<li><span lang="EN-GB">to solve this deficiency, the design approach is to hide the JNDI lookups behind a ServiceLocator pattern.<o:p></o:p></span></li>
	<li><span lang="EN-GB">as of the date of this writing, it seems that JBoss 5Beta1 already implements this in a basic manner.<o:p></o:p></span></li>
</ul>
<p class="MsoNormal"><span lang="EN-GB"><strong>2) Environment entries cannot be injected into Entity beans</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">although not specifically stated on the spec but technically possible, injecting environment entries into entity beans does not work. The xml schema definition refuses the ejb-jar descriptor when this approach is tried.<o:p></o:p></span></li>
	<li><span lang="EN-GB">furthermore, other injections also seem to be just ignored by the EJB container.<o:p></o:p></span></li>
</ul>
<span lang="EN-GB"><o:p></o:p></span>
<p class="MsoNormal"><span lang="EN-GB"><strong>3) Default Entity Listeners</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">the spec is really confusing and dubious at this point. Although the documentation points to a certain xml format with default entity listeners been possible, the official xml definition file does not even consider this directly.<o:p></o:p></span></li>
	<li><span lang="EN-GB">when the definition spec is properly followed, the default entity listener is just ignored.<o:p></o:p></span></li>
	<li><span lang="EN-GB">the solution is to define the Entity Listener on every class that needs it.<o:p></o:p></span></li>
</ul>
<p class="MsoNormal"><span lang="EN-GB"><strong>4) @GeneratedValue only works on @Id annotated members</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">if @GeneratedValue is used on a different member than one annotated with @Id, it is completely ignored.<o:p></o:p></span></li>
	<li><span lang="EN-GB">GlassFish seems to throw an exception when this happens but the current JBoss implementation just ignores it.<o:p></o:p></span></li>
</ul>
<p class="MsoNormal"><span lang="EN-GB"><strong>5) @GeneratedValue does not work in composite primary-keys</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">although nothing technical could actually deny this concept, JBoss does not implement it at all.<o:p></o:p></span></li>
	<li><span lang="EN-GB">there is a JIRA entry regarding this subject at http://jira.jboss.com/jira/browse/EJBTHREE-508 but the resolution state is "rejected" due to the quite arguable comment of "this is not expected to work. It doesn't really make sense to get a PK including a surrogate key and something else"<o:p></o:p></span></li>
</ul>
<p class="MsoNormal"><span lang="EN-GB"><strong>6) Persistency cascading and multiple persistence fails if not proper surrogate key is previously given</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">the EJB container gets really lost if it does not find real surrogate keys when cascading persistence or persisting multiple entries.<o:p></o:p></span></li>
	<li><span lang="EN-GB">it is expected that the entities either have a previously defined surrogate key or that the generated id be known to the EJB container before-hand (before actually doing a round-trip to the database and fetching the recently given id)<o:p></o:p></span></li>
	<li><span lang="EN-GB">although old versions of Hibernate (the underlying JPA implementation in JBoss) allowed this round-trip to the database, newer versions (and the EJB3 approach anyway) is toward a more purist OOP perspective where the container actually "knows" the ids before actually persisting the entities.<o:p></o:p></span></li>
</ul>
<p class="MsoNormal"><span lang="EN-GB"><strong>7) @GenericGenerator is not support in the deployment descriptors</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">@GenericGenerator is a very powerful annotation extension in JBoss. It did not enter the final EJB3.0 spec due to time constraint problems.<o:p></o:p></span></li>
	<li><span lang="EN-GB">although this extension works wonderfully fine when implemented as an annotation, there are no deployment descriptors available to overwrite its standard behaviour in xml.<o:p></o:p></span></li>
</ul>
<p class="MsoNormal"><span lang="EN-GB"><strong>8) Composite keys' members cannot take part in a relationship with another entity</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">when using the @IdClass annotation with associated entities as part of the composite key, the annotations parser of the EJB3 container just ignores the fact that it represents an entity relation and loses all mapping facilities (specially when a "mappedBy" is needed).<o:p></o:p></span></li>
</ul>
<p class="MsoNormal"><span lang="EN-GB"><strong>9) Deletion of Orphan Entities is not part of the spec</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">when a complex graph entity with associated entities has some of these entities removed, the persistence process ignores this fact and does not delete "orphaned entries" from the database.<o:p></o:p></span></li>
	<li><span lang="EN-GB">this is a known flaw of the spec and the current solution is to use hibernate-specific mechanisms.<o:p></o:p></span></li>
	<li><span lang="EN-GB">it is also possible to just remove the underlying entries as a whole and recreating them (quite an expensive solution in terms of database access).<o:p></o:p></span></li>
</ul>
<p class="MsoNormal"><span lang="EN-GB"><strong>10) Pessimist Locking mechanisms (i.e. serialized) were just ignored in the spec</strong><o:p></o:p></span></p>

<ul>
	<li><span lang="EN-GB">the spec assumes that advanced locking mechanisms should be controlled solely by the database server and concerning subsystems.<o:p></o:p></span></li>
	<li><span lang="EN-GB">that said, it does not provide any fine-grained access for changing the locking mechanism to pessimist scenarios.<o:p></o:p></span></li>
	<li><span lang="EN-GB">the .setHint() method of the query is to be used for vendor-specific implementations and might have some specific hint for changing locking mechanisms. Even so, this is not the case for JBoss.<o:p></o:p></span></li>
	<li><span lang="EN-GB">this is a known flaw of the spec and the current solution is to use the EJB-specific recommendation of optimistic locking (using annotation @Version on entity beans).<o:p></o:p></span></li>
</ul>

<h1 align="center">
  <img src="assets/entharion-title.png" alt="Entharion">
</h1>

Long before the Great Underground Empire was defined by the eccentricities of the Flathead dynasty, the bureaucratic efficiency of FrobozzCo, or the perilous, pitch-black caverns where grues roam, there was simply a scattered and untamed land. It was a realm of fragmented magic and chaotic geography waiting for a unifying force. That force arrived in the person of **Entharion the Wise**. As the legendary first king, Entharion conquered the chaos, united the warring factions, and laid the literal and legal foundations for the kingdom of **Quendor**.

In the context of this software ecosystem, this repository serves an identical purpose.

Building a robust Z-Machine interpreter is an exercise in taming decades of scattered documentation, intricate specification files, and nuanced historical edge cases. This repository is the foundational realm where that chaos is conquered. It acts as the central hub for all the resources, tests, and reference materials required to build a compliant virtual machine. Just as the historical king established the stability necessary for an empire to rise, this repository provides the structural bedrock that allows [Quendor](https://github.com/jeffnyman/quendor), my actual Z-Machine interpreter application, to be successfully realized. Here, the foundations are laid so that the empire of text adventures can safely run.

---

# Contents

This repository contains a lot of binaries for Infocom and Inform text adventures. It also contains a great deal of source code for many of those games. In the list below you will see reference to "MP" and this refers to the "Masterpieces" versions, more specifically those versions that appeared on the _The Text Adventure Masterpieces of Infocom_ CD collection released in 1996. You will also see reference to either "LTOI1" or and these refer to the _Lost Treasures of Infocom 1 and 2_, which were a collection released by Activisoin in 1992. Those two distributions each had some oddities. The Mac and PC directories on the Masterpieces CD ended up shipping with different versions. It was also the case that _Hitchhiker's Guide to the Galaxy_ and _Shogun_. The LOTOI series also had different choices of versions for the various games but, on the other, did include the games missing from Masterpieces. What's also interesting is that LTOI was released for the Amiga as well, and that mattered in terms of the some of the differences that the Amiga versions provided.

You will also see reference to "Solid Gold" and the context here is that a few of Infocom's earlier games were re-released under this branding, taking advantage of the version 5 features but also being distributed with in game clus (called "Invisiclues"). These versions used ".z5" format in order to accomodate the additional text.

There are certain versions where the only source code available was for the so-called "final dev" (FD) versions. These were actually entirely unreleased versions, usually with changes being made to them when Infocom's development team was effectively shuttered.

You will also see me reference "resource blorb provided" for some games. The context here is that games with sound (_Sherlock_ and _The Lurking Horror_) and graphics (the z6 games) require having those sounds or graphics packaged in a way that a modern interpreter can actually read them. I have included all such files here (sourced from the [if-archive](https://ifarchive.org/indexes/if-archive/infocom/media/).)

The Infocom games cover the range of Z-Machine versions from 1 to 6. In 1995, Graham Nelson proposed versions 7 and 8 as modifications that would support larger game files, and this was in service of his Inform compiler, which served as a re-implementation of Infocom's toolset.

As a final note, I will say that while the source code for all Inform games is pulled from public archives, where the authors have chosen to distribute their source code, the source code for Infocom games is, technically, proprietary. I say technically because while the copyright rests with Microsoft (previously Activision), the source has been available for a long time, much of it being archived on the [Historical Source](https://github.com/historicalsource/) repo. This, by itself, doesn't make it legal but Microsoft, and Activision before them, never really seemed to care. In fact, Microsoft has declared that _Zork 1_, _Zork 2_, and _Zork 3_ are open source. ([Source](https://opensource.microsoft.com/blog/2025/11/20/preserving-code-that-shaped-generations-zork-i-ii-and-iii-go-open-source)) That does not translate to the other games but, what this shows, is that Microsoft is clearly aware of the material that is out there and has chosen not to take any action.

## Infocom

### Zork

There are a lot of _Zork_ versions and they run the gamut from version 1 to version 6, with the exception of verison 4. It's worth it to include some z1 and z2 files even though they are extremely rare. Any interpreter that is specification complete, or even accurate, should be able to play these. Beyond that, these are some of the earliest creation of of _Zork_. It's worth noting that the "r2" file wa apparently pulled from a disk for the TRS-80 Model I.

- zork1-r2-sAS000C.z1
- zork1-r15-sUG3AU5.z2
- zork1-r88-s840726.z3 (MP; source included)
- zork1-invclues-r52-s871125.z5 (Solid Gold; source included)
- zork2-r48-s840904.z3 (MP; source included)
- zork3-r17-s840727.z3 (MP; source included)
- zork0-r366-s890323.z6 (LTOI1, Amiga)
- zork0-r393-s890714.z6 (MP; source included; resource blorb provided)
- beyondzork-r57-s871221.z5 (MP; source included; resource blorb provided)

### Other Games

- amfv-r77-s850814.z4 (MP; source included)
- borderzone-r9-s871008.z5 (MP; source included)
- bureaucracy-r116-s870602.z4 (MP)
- bureaucracy-r160-s880521.z4 (FD; source included)
- cutthroats-r23-s840809.z3 (MP; source included)
- lurkinghorror-r203-s870506.z3 (MP; source included)
- lurkinghorror-r219-s870912.z3 (LTOI1; Amiga)
- seastalker-r16-s850603.z3 (MP)
- seastalker-r18-s850919.z3 (FD; source included)
- trinity-r12-s860926.z4 (MP; source included)
- witness-r22-s840924.z3 (MP)
- witness-r23-s840925.z3 (FD; source included)

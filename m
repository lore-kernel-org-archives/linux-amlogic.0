From: moore@free.fr (Chris Moore)
Date: Sat, 25 Mar 2017 15:16:11 +0100
Subject: [PATCH v2 1/4] mmc: meson-gx: use bitfield macros
In-Reply-To: <ed2aa5cb-4cac-11b6-1be4-5d0e42001c45@gmail.com>
References: <aae9e7c7-d8a2-72b1-22f7-f0ad513d4667@gmail.com>
 <ed2aa5cb-4cac-11b6-1be4-5d0e42001c45@gmail.com>
Message-ID: <22cd1b77-41b7-3283-f184-5bb916bdb52f@free.fr>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

Le 25/03/2017 ? 11:23, Heiner Kallweit a ?crit :
> Use GENMASK consistently for all bit masks and switch to using the
> bitfield macros GET_FIELD and PREP_FIELD. This hides parts of the

Nitpick:
s/GET_FIELD/FIELD_GET
s/PREP_FIELD/FIELD_PREP

> complexity of dealing with bit fields.

Chris

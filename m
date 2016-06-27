From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Mon, 27 Jun 2016 15:52:11 +0100
Subject: RTC support for AMlogic devies
Message-ID: <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series is support for the RTC block on some of the AMLogic
Meson ARM SoCs.

The first patch is the driver, followed by device-tree patches
and enablement for the ODRoid-C1 (where it has been tested)

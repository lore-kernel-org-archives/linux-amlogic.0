From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 21 Dec 2017 20:37:24 +0100
Subject: [PATCH 0/2] soc: amlogic: meson-gx-pwrc-vpu: fix two issues
Message-ID: <ef5a7b53-867e-3a34-96d2-b22d13526b90@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series fixes two issues, one being more cosmetic and the other one
causing errors during shutdown.

Heiner Kallweit (2):
  soc: amlogic: meson-gx-pwrc-vpu: don't print error message on probe deferral
  soc: amlogic: meson-gx-pwrc-vpu: fix error on shutdown when domain is powered off

 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.15.1

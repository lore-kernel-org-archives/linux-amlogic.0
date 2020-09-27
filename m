Return-Path: <SRS0=PnGF=DE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81A2C4727E
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2020 19:55:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E8121D95
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2020 19:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FqCmn2OH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69E8121D95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSiJMtKjFD09pT4n58rqVDUSIqAV05s5A6zhi4M0Uqs=; b=FqCmn2OHR0y9pDe45t/hjzltxQ
	akzGSAgfSn2KSdf1z84MrFee1s7JZkJ4qyy7ii4fUVZbk/zGtH3aFe4Vd2nqHWVsJPZrvqpkpGE9H
	jppCWtcqai6ODLlS4PNddHikjnfG/qX0ewD3687DZHq3x0z/9EfiW0ct2dUx8+CBuZSD7h+qcXRNz
	qGKJWCdECnSqx0hsKrTE2wc882zE5Ycuh7y7gOp3xZoipHnR9Lcue2C1Sf6DlIXNTOTMLWeYWmCR4
	+V8ZhzAmHzJoWstC42etrVX5hrINeUxaRwwTj0+K29Le8yf1SBCrE0oXF3K3we/0FuiSa6IJ0oD2T
	zCk06S/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMcld-0003uA-EV; Sun, 27 Sep 2020 19:55:29 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMclT-0003q6-7t; Sun, 27 Sep 2020 19:55:20 +0000
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; d="scan'208";a="360169486"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 27 Sep 2020 21:55:11 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-iio@vger.kernel.org
Subject: [PATCH 00/18] use semicolons rather than commas to separate statements
Date: Sun, 27 Sep 2020 21:12:10 +0200
Message-Id: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_155519_532712_053A9ED9 
X-CRM114-Status: GOOD (  10.96  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: drbd-dev@lists.linbit.com,
 =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-wireless@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-acpi@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

These patches replace commas by semicolons.  This was done using the
Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.

This semantic patch ensures that commas inside for loop headers will not be
transformed.  It also doesn't touch macro definitions.

Coccinelle ensures that braces are added as needed when a single-statement
branch turns into a multi-statement one.

This semantic patch has a few false positives, for variable delcarations
such as:

LIST_HEAD(x), *y;

The semantic patch could be improved to avoid these, but for the moment
they have been removed manually (2 occurrences).

// <smpl>
@initialize:ocaml@
@@

let infunction p =
  (* avoid macros *)
  (List.hd p).current_element <> "something_else"

let combined p1 p2 =
  (List.hd p1).line_end = (List.hd p2).line ||
  (((List.hd p1).line_end < (List.hd p2).line) &&
   ((List.hd p1).col < (List.hd p2).col))

@bad@
statement S;
declaration d;
position p;
@@

S@p
d

// special cases where newlines are needed (hope for no more than 5)
@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@r@
expression e1,e2;
statement S;
position p != bad.p;
@@

e1 ,@S@p e2;

@@
expression e1,e2;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && not(combined p1 p2) };
statement S;
position r.p;
@@

e1@p1
-,@S@p
+;
e2@p2
... when any
// </smpl>

---

 drivers/acpi/processor_idle.c               |    4 +++-
 drivers/ata/pata_icside.c                   |   21 +++++++++++++--------
 drivers/base/regmap/regmap-debugfs.c        |    2 +-
 drivers/bcma/driver_pci_host.c              |    4 ++--
 drivers/block/drbd/drbd_receiver.c          |    6 ++++--
 drivers/char/agp/amd-k7-agp.c               |    2 +-
 drivers/char/agp/nvidia-agp.c               |    2 +-
 drivers/char/agp/sworks-agp.c               |    2 +-
 drivers/char/hw_random/iproc-rng200.c       |    8 ++++----
 drivers/char/hw_random/mxc-rnga.c           |    6 +++---
 drivers/char/hw_random/stm32-rng.c          |    8 ++++----
 drivers/char/ipmi/bt-bmc.c                  |    6 +++---
 drivers/clk/meson/meson-aoclk.c             |    2 +-
 drivers/clk/mvebu/ap-cpu-clk.c              |    2 +-
 drivers/clk/uniphier/clk-uniphier-cpugear.c |    2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c     |    2 +-
 drivers/clocksource/mps2-timer.c            |    6 +++---
 drivers/clocksource/timer-armada-370-xp.c   |    8 ++++----
 drivers/counter/ti-eqep.c                   |    2 +-
 drivers/crypto/amcc/crypto4xx_alg.c         |    2 +-
 drivers/crypto/atmel-tdes.c                 |    2 +-
 drivers/crypto/hifn_795x.c                  |    4 ++--
 drivers/crypto/talitos.c                    |    8 ++++----
 23 files changed, 60 insertions(+), 51 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

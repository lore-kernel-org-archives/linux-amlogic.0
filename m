Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691BFC352BE
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359F0206E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGMflDHD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mEbJKx7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 359F0206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o0fylHnMysPMb+/2TDV5w0NLPyZYuI8vU64AY+Sy9+4=; b=kGMflDHDq1oPOT
	WdvRALSgDgAdi+dLXu1GsHX+5OIt886Nu9P+zA/gyTL2EKj3BdIvTuUVZErmTq5SKktUx09t8H3G7
	TxInQWutok3pZ0MoRQE2gp92vbIOoDwp6c7xuEzsflZn7WqlsF7xqBtHuv9jDnXq9jg2Bj7rpiY/9
	1bKleU2W0Fs/ltaSO4qmkDqB9UyqFwHHZHsOsrsObHxemv9NaPcVYXarp9A5LaxwxAOc0FMhB/YcM
	LGLcXFaZYqm8WS5v38++ScWD0aP1zbZxTCr0uUpvHmY/T+Ul7VeN5ytk9Q6Fw/01+VP49/lIZblyw
	AW3yBQHjXr/hAUfJO8ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORxz-0008QI-Mt; Tue, 14 Apr 2020 20:15:31 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORxw-0008Og-Pv; Tue, 14 Apr 2020 20:15:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id y24so15783348wma.4;
 Tue, 14 Apr 2020 13:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/nMN3gP9x2ARfODCEnbyaFnmiKSgzhDo+Aw3jjcLnlo=;
 b=mEbJKx7U88hspWaZQv2wZirmksuZrorf1nF8yEpwzZjYupFgLEII0wWhYQBph6N1GQ
 TQZDp9FTxyLAVl+eof0qZzzAhwqgnfNRHjj0CAVmvrM34KAuoYv4J/u1tB17P8D9Vn9f
 /fdr/NS/i5wKBsfX3TGXfy1L52YyO9FKGVb+onQTJ9LpQL0d3/fbOGucdabipdTpSaSs
 h9BZxhPcFRZaEihwL5XJ7Pjok1f6IMu5cQSyqEKXHFRjyDTQTZAD1KlUF+mi2NbUl8b6
 D9p7Ch03BlS7tu4NoPWtlNF/lAfwQN7SYdDRSe2pEyI3N34zkhd4ioKbPAuMXPdHuon8
 HWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/nMN3gP9x2ARfODCEnbyaFnmiKSgzhDo+Aw3jjcLnlo=;
 b=hwgo2OhM4DqFrXxAMMRkUMAu74+VWsLFFJlEpf4XBnS/t9VxGP95m7yXjrOAvdWO0M
 yXS++akJhVK6/X17Iu4FXARJtk7PVVWt5SUcTphL0B9J+7tJqDON2y+0y/6hyQJT9XNA
 TttNpU1M7Fe0n80a7sUYnYemV9AGOlPl4Vr2GfEczq627MwjZtDk/CsYfuUnUyGNswVz
 P9jZXlFRItwXFrbY9UTqN/LXIUmLy2fvpuh3j8T+lCv3XsWxkreYdQgGkSaXfBZPxMHL
 NrNSKhdv0f1KsW/ReVbSqM148ZfoSG3xoumGIiWknLNSm6TA2eIKMfbMdOeHSp2LPpBt
 o1qg==
X-Gm-Message-State: AGi0PuZLMifLNa6H1yUY1xMTpeF65qekWLDSpuD5/nIusIzTJ9poP00T
 nQ3YJOgRn5FYaV+L2dMMKqc=
X-Google-Smtp-Source: APiQypKh2JU4ueEU0WUjbHYK8S4/0j/0MkKPw8LrYTuKKOm8lG5Osf/3Xu2oOVPnjrrPih3R/LI0Ng==
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr1610523wmi.159.1586895327469; 
 Tue, 14 Apr 2020 13:15:27 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13717DF00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3717:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id u17sm22537467wra.63.2020.04.14.13.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:15:26 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RFC v1 0/4] meson-ee-pwrc: support for Meson8/8b/8m2 and GX
Date: Tue, 14 Apr 2020 22:14:53 +0200
Message-Id: <20200414201457.229131-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_131528_866800_D58A2386 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds support for all "older" SoCs to the meson-ee-pwrc 
driver. I wanted to compare as much as I could between my Meson8b EC-100
(Endless Mini) and the Le Potato board so I added support for GXBB, GXL
and GXM as well as for the SoCs that I'm actually working on. I will
send the ARM64 dts patches once all of this is reviewed and merged.

@Neil: I would like you to review especially the GX dt-binding patch.
The old GX driver seems to include the same reset lines as G12A *plus*
"dvin". You probably know best whether that's needed or not - for now
I decided to keep it (as this is what "works" with the old pwrc driver).
Also I decided to use your copyright in meson-gxbb-power.h since it's
a shameless copy of meson-g12a-power.h with s/G12A/GXBB/g

I successfully tested the Meson8b part on EC-100 where u-boot does not
initialize the VPU controller. So this the board where I have been
struggling most.


Martin Blumenstingl (4):
  dt-bindings: power: meson-ee-pwrc: add support for Meson8/8b/8m2
  dt-bindings: power: meson-ee-pwrc: add support for the Meson GX SoCs
  soc: amlogic: meson-ee-pwrc: add support for Meson8/Meson8b/Meson8m2
  soc: amlogic: meson-ee-pwrc: add support for the Meson GX SoCs

 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 102 +++++++++++++++---
 drivers/soc/amlogic/meson-ee-pwrc.c           |  98 ++++++++++++++++-
 include/dt-bindings/power/meson-gxbb-power.h  |  13 +++
 include/dt-bindings/power/meson8-power.h      |  13 +++
 4 files changed, 204 insertions(+), 22 deletions(-)
 create mode 100644 include/dt-bindings/power/meson-gxbb-power.h
 create mode 100644 include/dt-bindings/power/meson8-power.h

-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

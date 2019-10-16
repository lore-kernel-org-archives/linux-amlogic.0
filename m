Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFDBFA372A
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 17:09:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 629FA2067D
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 17:09:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kz6OBghZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+a1VT2O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 629FA2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7LUA+2Ke3sVll8fcvuevG2ZAS29Oufi9U0FpJ1yO8jE=; b=kz6OBghZKSXuK70f48AUpCsUzW
	c9rV6BIPU64OAQ4UnsqpHAMOWma++EKmJ25+MjzqZMVHQ9l88RT8Z0jswrX+HjEU0uvwUkcFZ0ziw
	wSP1aH5LSLHZ1XbFX2lxBQz4dSUJhPakmhQkIzQlzY7bUajk/Itux168l8ZQOrFDg8dU7069s6bA1
	0aQloHylm8/SqHAEsTZ6s+GiGq8pck8tjc75v//Ua13Rs3VOG5BgMBVvl1X//cIj3cNwbCaEJOY+L
	oB/2L5DzTylBOLBVl8zDLcAwL4brUlZJYnkWMuKe1IIBJ9MKT3DMuIq9kutb/Du63OwXO/PVrEeHJ
	O5mmtdtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKmnN-0004M2-5g; Wed, 16 Oct 2019 17:09:09 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKmml-0003n0-Aw; Wed, 16 Oct 2019 17:08:32 +0000
Received: by mail-lf1-x144.google.com with SMTP id a19so5219925lfg.12;
 Wed, 16 Oct 2019 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FuDtedlY48DcctCZGWagsRf8MsM87uwA3mMuVGQ2AP8=;
 b=j+a1VT2OS4bm7ECykAC43ju60WarYAfWCbRzuFLrL1hxbpgI3Z4j7pRhUEai/49rJ9
 i48Z56uH5ua66STUHM58TXOltWf4jqVt4q70XzNx6Xa/pb+7PaTc9wej5Uc6Wn5/krkQ
 Vb5+qH2HJrsvo4vOpu/boufSBlQMCwGX9+hcTLZy3E696r2y0B23YccJG92eOKxRjjzJ
 fvBSjdk9kz2z5Rin4tvxtefT/UsjzQ9A2Vht8QkBkV33orbNGrGwyM5GMDqwjZP8Jlgj
 qKETLs4Jb5W07NgAbvDu2uVy5YSvJHNegP8luJGJOGZUHoKkAQ9Dvqv6sVk1rmMfwZP/
 zr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FuDtedlY48DcctCZGWagsRf8MsM87uwA3mMuVGQ2AP8=;
 b=g9kMrnehqXaI2m0LAtbKkII3u2Otbin07CoeAOWamgNN7oSdVKNYCB5QC7LpgSJd1D
 hIw2ZPVH7M9vzwwzMIIDFGDQeau6WMEqRYXhkYmu/WnwgJ9YQkGFkx4iIdII/41x53q5
 96u1Ds+w7soscMafHqyHs9aB2A6V5knHiFopMIXAwjJ/9t8k/9PVhhEvtO5qyft51deU
 k+rrrmPNIjeUEAJgZdXiPt75wpcQ5WpsTvl3NCHbKlmywvEldXDoeWUJi253Te10V3RL
 LNUvULEIK5aAobzfHnw2FL0aaK8Cmb3bNG1i8HDnzfCJif6BkXFjXZaa/2r7GsO0zJuR
 JFbg==
X-Gm-Message-State: APjAAAWUpVmlOhq+ZqMhwKpmC0VKlUSpliE4SEQYC9SiAR1vev51F4su
 Zpv6grIbUGUGyWtVM27bN5w=
X-Google-Smtp-Source: APXvYqybaFGO1u4fZEPYMstx4sfISrbUPkeIsHhbcRYljDhIpvBSINMvFHrAxe5eS+JI8E/hZaMnnA==
X-Received: by 2002:a19:6a08:: with SMTP id u8mr1490535lfu.74.1571245709687;
 Wed, 16 Oct 2019 10:08:29 -0700 (PDT)
Received: from localhost.localdomain ([87.101.228.250])
 by smtp.gmail.com with ESMTPSA id q24sm6299182ljj.6.2019.10.16.10.08.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Oct 2019 10:08:29 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: meson-gxm-vega-s96: set rc-vega-s9x ir keymap
Date: Wed, 16 Oct 2019 21:07:36 +0400
Message-Id: <1571245657-4471-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571245657-4471-1-git-send-email-christianshewitt@gmail.com>
References: <1571245657-4471-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_100831_376832_1628D92B 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add an IR node to the Vega S96 dts to include the rc-vega-s9x keymap.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
index e2ea675..0bdf51d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
@@ -35,3 +35,7 @@
 		reg = <0>;
 	};
 };
+
+&ir {
+	linux,rc-map-name = "rc-vega-s9x";
+};
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

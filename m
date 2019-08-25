Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0831C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:04:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C081721744
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQG26wJX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsFhtGys"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C081721744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hB38nur41Swllmc2ggkz3vrgfqfhwVQS58quDlO2xTA=; b=nQG26wJXuN3gRs8vApWnlzS9sJ
	pkiZHgRKPK4T0k3m3OLVJkAlWFaqDT0T6TqUjVuyOzNzmeYOkE89qAbFBlIJnQeNJQ4YtBBNv69y5
	ecosIbzRceoijWiCeB2qC7Py3rOQPu5y2p8nabrXl9oBD49isX0BQK0rhf2XsF/iiljA4AaPNM+Vd
	vYjpFFifQvJkyMmHCyauinVVShLeyZjMdIRc3NQVkSQfGMvgNvDSz5tEEubPKwGEuDqHan2HXkAMW
	CHOuW10f3ou1U4fFzoMyN+0V8BaZaLpIIc/sAJYzs7y2UaPUvPitVNJgx3i/nJ372haxSFh1Jd5qz
	Szec5ozQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1jlX-0007Jq-M9; Sun, 25 Aug 2019 04:04:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1jjd-0005l1-7n; Sun, 25 Aug 2019 04:02:34 +0000
Received: by mail-wr1-x444.google.com with SMTP id u16so12130560wrr.0;
 Sat, 24 Aug 2019 21:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nS5ZdwaXnWLnup1daWCQzgoGPiOKricQ3p0EiljFPek=;
 b=YsFhtGysGFaBx0FpoKJiH+kDHGWWH2ZTZCvrxYciZu6TGElkD8hmOBYdl1IrsqJw1H
 bVnOr8TKC6t2jdWvfxVtI60Hi+53O1WRnEjXDkHQjfQzZzMtC74DMR423jRtUF7UL/BQ
 Gpdf15fJoQmY/1H/t0NN78HNREdCRlionQg3jCc8sqaJJkobwfX8woxGfE3WM7DILeeL
 QRB7hguPsEUlBLcBjt9+xflN7mdD1O5llbV+XFbR6aAWko9FKtgXZQSs0AxvaZm1Mx+k
 RxA0OO+p4sFltJtp+7Fg/3YlopTfKhUaF1s8vgoFKN5v2mvFn/mI5vSFhnnCPTCBCfio
 Telw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nS5ZdwaXnWLnup1daWCQzgoGPiOKricQ3p0EiljFPek=;
 b=tpk2XVKMN9W7fM0PildrMkuAAupQlcICoJKZl5AdqFlBpSo52bu7duModBdhzdeTVc
 lL81NDoKjLI0Rm1+pmf7LsRetmyNS1ukfDf/VUNJ22UODd7DqxWRyovB1ifXaC9uuqJZ
 vI2cDyYbzN5daSxurx9XtXnHNv3Kw/KMIbYUf40zINGfxALB1nFaX8T+SihdQOtAWAAW
 9/mMC5doECvjyM2MCS3rCXpHzrPcltUsjPFuXF4wX3CJRWdrUeuUJFG35VNJk5/zoLhL
 Oid3uADmMOoQ2iRumG6zBYZH0cOj6ZuiyUH2wZk+zmVUZNSdII+W7I66MsJDH2R/gN5b
 z8fw==
X-Gm-Message-State: APjAAAWUEBtrBk9w/Or/BxYbYfmS4LceM3x5/CBZELI/YhAbQ8ulIcW8
 D8F4oWTFC26WXgGV8+y8rgA=
X-Google-Smtp-Source: APXvYqzpbvks94RUaUaHxbIcLp4EI33cVGxO4/18OYAgWCn3juOpT/w3h/KFPUXwRVDgDJmS/myrJA==
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr10502168wrw.3.1566705751398; 
 Sat, 24 Aug 2019 21:02:31 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id a6sm6820985wmj.15.2019.08.24.21.02.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 24 Aug 2019 21:02:30 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: meson-gxl-s905x-khadas-vim: use rc-khadas
 keymap
Date: Sun, 25 Aug 2019 08:01:26 +0400
Message-Id: <1566705688-18442-6-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
References: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_210233_670737_CEB0B8EA 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Swap to the rc-khadas keymap that maps the mouse button to KEY_MUTE.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 5499e8d..2a5cd30 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -110,7 +110,7 @@
 };
 
 &ir {
-	linux,rc-map-name = "rc-geekbox";
+	linux,rc-map-name = "rc-khadas";
 };
 
 &gpio_ao {
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

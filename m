Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F55C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NCa1PXW7StlXywkRmF2EtIKPmen8tv5zttIDSrxBv4=; b=OVbYtDuZiFoIJn
	AuU60OpPQBHAy7gtpuCJhbACqJNfTu/Ad99nQayoAcjpQP9qXaF3KUfY5xo/AzKHLEFgQfPqUZsCW
	4bE2Cq+dQwTJZbOv4/5fnupClN1IvkZkZELNzQ4H9ZpSWQiDPg6bUwq1e9X4WHvUX4/tXcJsB8PGk
	kZH8b+0b1o9f5p3+0DBDB7pW83cK9txbGCPQC2rfo5sWOS64yTmGE+hgMMFhwPry2bgXtoC5d2HNv
	NLFxk2F3nM+lIb2uhfzyemhBleH8rUJkyRcczf4YUADs9CPLvMZXsQvAv1Fg0BPp7R8EC0vYfEfDr
	6PuOK6ydVEiqbTGy2K5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIwv-003pQN-Qa; Tue, 24 Jan 2023 13:02:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIwZ-003pJ3-75
	for linux-amlogic@bombadil.infradead.org; Tue, 24 Jan 2023 13:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hJzShneJHj4d3JT3cYeiVzniHQ2E8HFG5vVm0+RLFIk=; b=Kag7Cs3WEea/HTdQfMbM5cPwLc
	opavkqS6UhzRTdJLzIbZq1ltBlxm/S6pxtvNB3bTSgQD1uRfjyAm7bJ1T6vEAVraPudNIYy9H8C90
	CtnjDRZQ09SP+FXuvftSKFP0tlLvUx2PSYG5vuZrD9++KqZd50bTbsEa60BPp+WQDPbLoy9sJcXGr
	Ak5+bTGwfJXzo20MPLwKjsFChK+KLFdWkkaiDjrjnWGE7NSgH8a+CURq43ErAkTstUYNfqlQ+YK02
	0ray7HtyA+O/pU2w6Ko9OfchvFnQSmVLxWjDuohS+tIAumLsRkHW/V7naaz6Clp0397iSF8nya26O
	bIXBdzew==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKGcs-001mrY-01
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Jan 2023 10:34:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id h16so13384469wrz.12
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJzShneJHj4d3JT3cYeiVzniHQ2E8HFG5vVm0+RLFIk=;
        b=u/YCRj3z6AWBMk1F2CzVe+9Y8Vf/OpLiJTIOIl3dZO0Xr1kBEfcuTgQT2vqYrBaxnj
         PC7x4Ck+DnbsT4S8+94xTWDU2fml1QrMM5De4CIgnA8/iW00NYmJAMLKNZFr+R7U1QlL
         3v+hY0eRAqK0RJd7Yw775tRZg5HZrgzU+9tb9zpvrGMznLvYxmbetFNVBRt5eILtTaIt
         zAyOUTMnj/e4Bmh9UbTDVGsJ8pZDvdJeIvs7s0m/HzqGY4TwAlPkOnHQA5hv+qWlLiXn
         7KUmftvnvCX2rYgD0kPXYjBUn64lyduK5mRqdZ4N+NJ9F9hpWX+71oxY2U7XhVnVVXWk
         m0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJzShneJHj4d3JT3cYeiVzniHQ2E8HFG5vVm0+RLFIk=;
        b=pEkdZUbrNWOQXm40uqklKBEUAGz2NFcFB34HXLpFCBdWdDcu4spvaCnyhy0lNTgfLS
         oylGGyAFysS7ay/EAxS6O/k/2bybGl7nmIQdMQ+ivvmhfYsKCLtt4Xcyx79F70c/GfLo
         0NIgUokl5t4TNmMdjyHIyIJ3Cx6cX7Z6qEvT4N369lkRrLtKrdurVPgdib7Wc5Mun/QR
         5l1ggZxgxKyTLVLXuNRcpRvnjdgl0/ywkzElBUcJQ5M3GBkqXm5NyCqhoBbMhjN2faoH
         mXTQ0u2KIppHNwT02gMcyf70063OWkZy2nPBtIDNxHHf14ILoBavp+495TdWWjslEZah
         QJBA==
X-Gm-Message-State: AFqh2koIi0X+sqM+Zvye54Hm+sci8mEy7TGlGL9oHfTZgaliQuJiAzSF
	AB/1hIIwKwzG+y3ggn7ybnke4w==
X-Google-Smtp-Source: AMrXdXtD+WCyaBwihNaXexTggR1I5lmQccmj0wuEIaZSvJRfJaNM/WI7ebqOHeI0sDgUHmzGTH/TIw==
X-Received: by 2002:a05:6000:16ce:b0:2bd:d9cc:920a with SMTP id h14-20020a05600016ce00b002bdd9cc920amr29464286wrf.45.1674556468121;
        Tue, 24 Jan 2023 02:34:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:25 +0100
Subject: [PATCH 04/14] arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx:
 fix supply name of USB controller node
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-4-44351528957e@linaro.org>
References: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
In-Reply-To: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_103402_377488_88DDB6D1 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fixes:
usb@ffe09080: 'phy-supply' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
index 22fd43b5fd73..1916c007cba5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
@@ -303,7 +303,7 @@ &uart_AO_B {
 
 &usb {
 	status = "okay";
-	phy-supply = <&usb_pwr>;
+	vbus-supply = <&usb_pwr>;
 };
 
 &spicc1 {

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7547CC61D9D
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juIU78aNdc6r9xf33+ZPLhhg6eIKJMeb7oj5ZsZBfBw=; b=x3aB2d2MK1fe3K
	k+Dq6e16xEAUMY/nWTjjHmLPxydcixIkWkHJYtBNl7lsgk34/rgxA1vq1Yz3/dQknjRU38ddv6jL5
	uPkgcJ71IuHnyzzN9a7BvMpwR9xT73j1ovsG9TdM6qUI1Mg5laxpKoHqhmfLdMfFsFx7kAyHB6+rX
	P8CSBCDyZMBEyBbvTEe6Zf7h92tfxzEPjHKWIohF1BCK3McrOtymNLdJY5bmirr9CvFkt+xk2iau1
	aCi51rt/5tsM2BeqybCn2a/y3u6lClfOcOUc0LTrdYkc3ifPl/aAl0SULAdKhpo9eZa7d1PufJpAP
	JpvVu3UqQScO4iD2TBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaB6-006EN3-OX; Wed, 25 Jan 2023 07:26:40 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaB0-006EKa-No; Wed, 25 Jan 2023 07:26:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so1152153pjq.0;
        Tue, 24 Jan 2023 23:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33aN1+zq+dtGXTv8s+/MpRCqjJHz2bZNw6EwNpZ5/gs=;
        b=K2lG+yw0+Rn6HcVYC5tcy2hi01zXkQR8wEQ8EtBH+ci5XWX1kwN/xDtFkP0gic6hnz
         DiuqBgJFXze6HxjSwJmstn/oVyZS81IG9OJM12dsBCVs4omtw0f2e4lCFUD4HJ2R+0TP
         1yyIHxfjLvBu3Nrk5ME7ov2C+xKSMvjixQkr5OOyVcoRNpYnWYyuacuxFDLBTgvEocf5
         4KXXgtqQp5SYI8JQVyldut7JI3pyh+Q5bRzgeTKd0oJnUMPT9/qR/jdo3Kl7n6ik3Bq2
         RiRQw5N81/oZqnU7c3kYHHuuBjwnNxiBPORaV/AG8bxjhTUY493BK7Khj9S0NigZDlhw
         9lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33aN1+zq+dtGXTv8s+/MpRCqjJHz2bZNw6EwNpZ5/gs=;
        b=FovgK1tsYz7WUaehr1zjR7cHv2vhh4Tmqk+PMhX7f0yamts/WR1Disht6sxujefLJz
         gVin92aUZgjBMRLX+hGxBED2ruxRs1J1LRkLe0nAa+JLjQt5louV1PpUvG+eP8n+fUZO
         4lv0ysZkUO/Wy/CDnZPvrCOIBPHnclc+vxxVpFFtoBzEjZ/4CfROHqo8xCcx4VFqyui5
         gfimYcAtjw0xqm2Qkidq+/FfjZC8T2YHyeTEjQTTsCP5czPZfeNWzJn9THbzlvnP0sKb
         WIHNYINcwJAk3Z9U9L9Axlwg6bDeBqH9+kYAxvy+0hmiZfuhxttExsHniPg26wYKiTEm
         vQIw==
X-Gm-Message-State: AFqh2krxO7YXIvNicWuobL89lTPx1dJ2V1z9CrRhgF2bZvbQCE6TOvgx
	MdREqJKcB0haeDz4nXZqlXA=
X-Google-Smtp-Source: AMrXdXuEqM7PC1bfJVNeUa2SMWHmqUNQrAShciI8bsA0cRfhoxLrHrqtQCFj7/OdJfUKwiui+C605Q==
X-Received: by 2002:a17:902:9b8b:b0:192:50cd:97e2 with SMTP id y11-20020a1709029b8b00b0019250cd97e2mr29898777plp.26.1674631591901;
        Tue, 24 Jan 2023 23:26:31 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001769e6d4fafsm2902500plf.57.2023.01.24.23.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 23:26:31 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND linux-next v4 2/4] arm64: dts: amlogic: Drop superfluous dr_mode in usb node on odroid c2
Date: Wed, 25 Jan 2023 07:26:02 +0000
Message-Id: <20230125072605.1121-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125072605.1121-1-linux.amoon@gmail.com>
References: <20230125072605.1121-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_232634_789713_09A41604 
X-CRM114-Status: GOOD (  12.57  )
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

Drop superfluous dr_mode="host" as it is the default in meson-gxbb.dtsi

Fixes: f24859bbec8a ("arm64: dts: amlogic: Used onboard usb hub reset on odroid c2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 01356437a077..70b10934a811 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -399,7 +399,6 @@ &usb0 {
 };
 
 &usb1 {
-	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

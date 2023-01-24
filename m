Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBECC25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pS5t3cXcEM8ag7ccZ7sWIgG7URGuQrYK50ZFVLSkXs=; b=HmhLf4YN1PUe9I
	gzQ500yRghATheoPNkdNwJHEa0Fsq26eLO1aqr57tVjpq9CFTp9FWK+fwzRYrflB5vRuSlOPFxAFP
	XvxHwI9Dm72XmBzjGiQkZ8GLRvxPxZeBXVrqXJGf6f723mIIbPXLFg1amtZIIYhtxNhWa16SVooj3
	8fLpBQHLi5GONmellwTMjHjTrM6mYUEN3BCze35Dky0fz17zoOzovv+QuvNTKvSGx4wGAwhpOMEry
	kSEJf4rfz4hKiUCMNw1OOaDGkQwATeTZWQ50byBBqDYgB7Xkq9uY53VnAvwtFnTONF73/Z0pexFFU
	idWmZubN8MU1RAJH2/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJ5K-003t5b-QN; Tue, 24 Jan 2023 13:11:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIyU-003qA9-H1
	for linux-amlogic@bombadil.infradead.org; Tue, 24 Jan 2023 13:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kf92k+BW04Wt2vsFzZg0r4ZmptHsw49XtqGj3I0e/gc=; b=S2GwZEgeHQPnwJR9KAKAvGAY5+
	nr7BV8UooYZYXljGf3JKxyXiEvs3MMg/i8P4FFv+0Nck+sW/opP2wGsx75Wq3uXrvBEHWOkHgVp5N
	e5oJmf/cvskChDGmMNJ5oOJ2vvAU3mB095cC2VUQXKnuOlruqg9hClnzoq5iBWnXHSuYG125IvomZ
	/zSP3KvKbVJcHoNqRl+ZAN4qh/G68cUTOhZAhs+9OoWPczvLWS9V5H2ktX/Qzc15dDB+0IPsT2cg7
	UcddAWPIrLZ0WrLSfLJi9fhZhone2cM8n6VlOfPTq+hCWvpJnnLTbLwgdCaviFZaVSq4oFyoJsT+w
	4qVgdgpQ==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKGcv-001mra-0g
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Jan 2023 10:34:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bk16so13385786wrb.11
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kf92k+BW04Wt2vsFzZg0r4ZmptHsw49XtqGj3I0e/gc=;
        b=jvsJwzM/WIeTejyhikwsX5mpm0TVybiCfIxP/71kr1GZMc7/ezpjsa8XUhFkGX7puh
         ZMuOv/5ZiCFMtAZ1uZzgmWt97VxMfRXWPhJO9VfNifWHv1ifJiOywmu4Av3NhB2km6xZ
         3ur6XeX2eyxBZ37FC2jeyuLFWTWBVe4adkx8cAyQ0+VwndjrT+2Yt/hUNVq3aU2285w2
         7k73fV6TapSmRZ2hXupU75EVU/NHjMkyPgrVz8qp4Rv+lLZSDvYmdrRwFIy4ZVTeAvQJ
         nLa7Xw21MO+kfVmP+QRWYqc4bvknfe7A6JFUnFPGXKzGtXfaPpIuVz5iA/TsQTpuxn1X
         CxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kf92k+BW04Wt2vsFzZg0r4ZmptHsw49XtqGj3I0e/gc=;
        b=g14ylNOS+tTQI6icPF9Vhm4rshuaCXU6AZwwz7LpIEzBKZU1GzyrnN53VNcHzEaAjk
         hu0e8+2iEdP1dUDDcDUNaWL4pcT4gXZHzxUYRvmZbtif79TBrKme+VP+zCnAjMzNfU4a
         UubBrxSnMRcxwe9iR52DaYiWXk6jF6Uhe3eVnN1UExnpQQiOOejfWkP9qHmtJlavx1Jw
         +HMIw5EmqVqsqT5L6C5Q+wbqOzftgyzvJ/yGwGrGsVon+4JyEMShf6PX3CnpCeEquQlJ
         3lRL4SW/Ym81/41/y4RJJT/l7ayghxEcaIIO0RoSDffXepkMSJ4xc/Bm/ClVBqGvwLju
         ff9w==
X-Gm-Message-State: AFqh2kpMOFvHeP3wbplsC5tFL9Q6w/Kw6UhM0F76Aw+67RBLT9DhVzMn
	mSYvTt3jPTWLb/TLoBDOeEU6XQ==
X-Google-Smtp-Source: AMrXdXtFdlMAU+HvZRltbYof9inRjog/t9q6bI6+HheCM54YOdhqSLbC4id1iR0wJiRra4F20MtkCw==
X-Received: by 2002:adf:f3cd:0:b0:2be:c5d:3564 with SMTP id g13-20020adff3cd000000b002be0c5d3564mr25812727wrp.19.1674556470022;
        Tue, 24 Jan 2023 02:34:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:27 +0100
Subject: [PATCH 06/14] arm64: dts: amlogic: meson-gx: add missing unit
 address to rng node name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-6-44351528957e@linaro.org>
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
X-CRM114-CacheID: sfid-20230124_103405_519693_86A78594 
X-CRM114-Status: GOOD (  10.46  )
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
bus@c8834000: rng: {...} should not be valid under {'type': 'object'}

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 11f3b3a4df97..1f9cfbf4fa0e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -532,7 +532,7 @@ periphs: bus@c8834000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc8834000 0x0 0x2000>;
 
-			hwrng: rng {
+			hwrng: rng@0 {
 				compatible = "amlogic,meson-rng";
 				reg = <0x0 0x0 0x0 0x4>;
 			};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

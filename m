Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61643C636D6
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfzYFOsCqfVqxuuQLIBba9h63ee4/viNR7YMZG3Vapk=; b=0hGJKPIP+DHr4y
	K2WXKK0JGI3fwtqMeGQKN0jgzjRTzwQj4rovxtYAwsCAVxQ9GmL5kJ7FsW0WwWQcbUsD2wX3hzx7I
	ZQksI7haGMbY1WTX3qHNWhGYHyCiNJ6NWFFfaARIQLuNwvqJaW3uspMc0Lp5skBGGKLilh4jDr1+K
	JwBUSvWi2tdijewdoqJgdGOFf5RDZjTfdAY8+YKf1U3lc/KRinr+RlkcV1xBGbnLax2cWe3dOS9mU
	19qsqJUpVQ78EsRL7wgo0h7uk2hcQFjt7tzmcZhMD3EiGYrt+qpvMW+tuVVE1c0ZEl5RyAkf9wEcZ
	fXfPfsrwuVIz5o6gcxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPaH-00Ccp2-Qa; Tue, 07 Feb 2023 15:08:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPZy-00Ccd9-2d
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id z13so3779281wmp.2
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE+dKl+sL3pb9GnFpnoaxbVtKqrHW1hzZtIQmyAek0U=;
        b=RQuUonvDuqF+3CCi+dn4x7dFkdKWYIEB+M4zklnLUsccDEck76Uy3uhC6xY4cFsRmr
         ut7f8/XvU/T605Hw0g4ZIEbY0v+2HLkQuCnQLDXlHIS/eHfXD4fgrG0CWSO/METEIxQo
         qD898z3aoriCToruKGEgcGnMsQOi4pgihLD63WksRsC3N7A3z+JmD0PNLw/VDXG1Uxfm
         /XSsr0uV355Wp8OlDrY/pact49VBHPB1xofVWu+UZo7NOAhv7KcKqyOwy/1PnaKyUy62
         6iyxRVvSIooTvdn/Ex2a3dgmVxZy39dESoOOrAl1Z+5BuqhacBS8WmEbejT4nRBPwdRl
         UWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zE+dKl+sL3pb9GnFpnoaxbVtKqrHW1hzZtIQmyAek0U=;
        b=IipzM+fYIHRPCr+brMYCDEhAaRUQj+7DCtb+WIhsB62/lhbPlXfC6QDuk4ED7R2mLV
         CsNpi27s9KkPS1O+LLROcqRvrei2wait7xMicyedLGl1Ndn7TOvYNyOPhEyagvUw9G3H
         2YEwyFHcprFg6TNKeWoHgp6SxeDbcNH1cafzP4Qf0ycD4OyhAtUCQMSaznDvKL+QOuXY
         SjOWPlkTlBsCZpcwuroA2tiPMCTfoakkQcJPMi9/xv4ET9YBda80jwbRjbUfaFa7vX++
         lK8gGgA4AcN/JH2cTlFmt1cbpSvQ7YF/wQPQe3uE+BZDWRt72v0ov8DqIEBBvwKgYL8J
         Haxg==
X-Gm-Message-State: AO0yUKXDD6+5tZx2XQu79RecJhjtdkpunEkuiD9uN2gq+0n53vb/1m/g
	NmOg9k4RMObE6+XsnmaGLKxKRA==
X-Google-Smtp-Source: AK7set/UpZz7GRnd79XenBIyRDwl2WBcPb+uvydZaMYj9J8t38c1xeJk+630ye1zxrpBmTat97VEcw==
X-Received: by 2002:a05:600c:993:b0:3dc:4fd7:31e9 with SMTP id w19-20020a05600c099300b003dc4fd731e9mr3528250wmp.7.1675782496107;
        Tue, 07 Feb 2023 07:08:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:07:55 +0100
Subject: [PATCH 2/8] arm64: dts: amlogic: meson-gxm-s912-libretech-pc: add
 simple connector node in fusb302 node
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-2-93b7e50286e7@linaro.org>
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070818_145704_CC9637AB 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

Fixes the following bindings check error:
fusb302@22: 'connector' is a required property

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts
index 444c249863cb..4eda9f634c42 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts
@@ -54,6 +54,10 @@ fusb302@22 {
 		vbus-supply = <&typec2_vbus>;
 
 		status = "okay";
+
+		connector {
+			compatible = "usb-c-connector";
+		};
 	};
 };
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

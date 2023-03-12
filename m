Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F073AC6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0h7lTB+Tp1GWpJ5KXAu+WOVxjCdLF/lJeIxPwGNWRfs=; b=Q0SyEIR3zWiFDn
	uiO1jNKBeVKIeZjQYU4Voj1oXte8OkCSo8OksV5xN/P1Z97ShS9PslOexnr58tPM7eZipF+Msmbhc
	br4qFzCDxGxhQYGTP54eahtE5CMa9wa2pV/AbHvsIDyz0/jyjPnE0d/PfQVB9eaIWK/FBendRmMxL
	uRJSTyt3373kX2hZAJ3xFDYu5KFYV9ir/2D61TV0kBdCVwJIJ9M5nW0vzsWwG0TIsMkn8rujc252c
	mkugTWEEnUhJulFcZqSgzsyDq+6CBI38ILDmtFt7/PcaQ8G1LxlNUP0LF5anOrPmxVWwQkvo/Entr
	2SSzMDJOjoxxgAtezsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM8u-002aOn-29; Sun, 12 Mar 2023 13:53:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1m-002Wgk-2R
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=; b=dNQqZy6LTkmxphB6EJ2jQrrhj5
	6TfgzhW6nxHVCfU2WWD2zE/wzOnHenVAqB487kvt3QAng3hRTYGYKF8bNFb2A+6Vcks18VSwwjGKq
	C9MSY/06RGeklgVxILei76mKYpVOwPOQAFwB8Vf33NNndIt7dRJe1m+mZ238ix76R+/1YUeepwIIe
	0U41L0+ZAc/pfXhFwLudFoIUqGwrjZyvgpXlUe2biXc/zMjfP3zSKM3BphUE3QAiJrlcd/R522Jdp
	GpboWCqcIdK8LsdN5GA/ORkmVNvpYS4khqdovMXiP4k47MGSXUnpvRDKqc6MnYiBvxbHlN/k8+hT5
	xXX3FMfw==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWk-0011Ef-2u
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:24 +0000
Received: by mail-ed1-x534.google.com with SMTP id cn21so8317594edb.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=;
        b=Vy9duYu5oml7kBElCY7/Pz9DoA06T0NpAzoFB/8UDRZyaoC1RpIJ1UG/pwIgekC2Xm
         yYW/KxCTuRHcGby/RdJBOs8FfozWHhANyCcxDcfPAptsunxdi4xdisq8hxE/EovjxMxx
         WjByu21a8DRYQ5vQ5rjtppMPmTA3YfVs7EfXHLOyMmvOw/czvNHgWfZxzwLoODRI5KEw
         vNanwMyr9B6tnUqhDIuZmnrX5YVE2IR3o04xY7Cs4tE2w9Qz305VEEdxXyxoLSTvTBjY
         Yy1omhrkhMUHIvMWUnx/Ay+JP5uqpp8jwJihgHxxCnFFmOGcACEyvVyl0XheIj0cDejW
         35+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=;
        b=4lPWFNYz7zJY88edE3sUEQKj3RykWylpks7V15tfdycu8cv6FIbcfMLVySbxj3Sn5v
         I4pI3Ad5CslgGOZgsh5eU5l0Chw6qJI/kL/GEPXqkUwp4/NpAPOLkpLdJX4bZQ7LHWWd
         iTchnHn0vZW7cVIUoqd5EQgFLpVQZGy9xKVvLIRZs9hHEJVmedVTmJbLiWOE1YxZdUrs
         EXlJbArYFDq/bPlnAD+5vk9bQS7g9VyUbZ9MnWcCVGnEGXA7tjVd2IJ2aETPtpV0WLPs
         jbssrtN+gMTBgyxl4yOB/JwUVa+3VnoF0SyVb4KNGBCKTfPiIjcH4zFRlofKSzl5AQHi
         4iXg==
X-Gm-Message-State: AO0yUKWjed3fIKvYxH/MtV17oXyHcixPR4Hw22EjJOUQLa293I7/t3tA
	8ewlNMac22udOh+qJqlS1tNUFA==
X-Google-Smtp-Source: AK7set89zg6fjfmD/Q83CKvXo7fQ6g/JeQCzWDXtSGLthFDWRFHtX2ThlhUxvw+IDwH+wYEhp3Ys0A==
X-Received: by 2002:a17:906:5284:b0:915:fbba:2e0b with SMTP id c4-20020a170906528400b00915fbba2e0bmr18851554ejm.58.1678626858623;
        Sun, 12 Mar 2023 06:14:18 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 28/28] media: dvb: mn88443x: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:18 +0100
Message-Id: <20230312131318.351173-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131421_151578_0577C965 
X-CRM114-Status: GOOD (  12.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciB3aWxsIG1hdGNoIG1vc3RseSBieSBEVCB0YWJsZSAoZXZlbiB0aG91Z2h0IHRo
ZXJlIGlzIHJlZ3VsYXIKSUQgdGFibGUpIHNvIHRoZXJlIGlzIGxpdHRsZSBiZW5lZml0IGluIG9m
X21hdGNoX3B0ciAodGhpcyBhbHNvIGFsbG93cwpBQ1BJIG1hdGNoaW5nIHZpYSBQUlAwMDAxLCBl
dmVuIHRob3VnaCBpdCBtaWdodCBub3QgYmUgcmVsZXZhbnQgaGVyZSkuClRoaXMgYWxzbyBmaXhl
cyAhQ09ORklHX09GIGVycm9yOgoKICBkcml2ZXJzL21lZGlhL2R2Yi1mcm9udGVuZHMvbW44ODQ0
M3guYzo3ODI6MzQ6IGVycm9yOiDigJhtbjg4NDQzeF9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9tbjg4NDQzeC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZWRpYS9kdmItZnJvbnRlbmRzL21uODg0NDN4LmMgYi9kcml2ZXJzL21lZGlhL2R2Yi1mcm9u
dGVuZHMvbW44ODQ0M3guYwppbmRleCAxZjE3NTNmMmFiMWEuLjA3ODJmODM3N2ViMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL21uODg0NDN4LmMKKysrIGIvZHJpdmVy
cy9tZWRpYS9kdmItZnJvbnRlbmRzL21uODg0NDN4LmMKQEAgLTc5OCw3ICs3OTgsNyBAQCBNT0RV
TEVfREVWSUNFX1RBQkxFKGkyYywgbW44ODQ0M3hfaTJjX2lkKTsKIHN0YXRpYyBzdHJ1Y3QgaTJj
X2RyaXZlciBtbjg4NDQzeF9kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAibW44
ODQ0M3giLAotCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIobW44ODQ0M3hfb2ZfbWF0
Y2gpLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBtbjg4NDQzeF9vZl9tYXRjaCwKIAl9LAogCS5wcm9i
ZV9uZXcgPSBtbjg4NDQzeF9wcm9iZSwKIAkucmVtb3ZlICAgPSBtbjg4NDQzeF9yZW1vdmUsCi0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA1C54FAA
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2024 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLDiW1XoeJgtoJLXNYJrYkku6TtbJ6CrKtHbtr5Gnak=; b=zqggTUogiLgVq6
	zLW6Og/sm2sFWRNyb9db67Xb21PaOsC9P7KGHKHu0ID4q9XJrFinGyyOd/FuczSCVotOo0Agt9Pst
	HSZLnA830VJ1c7glXW5frytemOA3gNaY0d1dQNxy49Q2IWFGYZaEdr3WCZ3FQWN7qyqIYY8MQ9ZxH
	rEa7y1n/qJ7UPloo1ud8Nc1N6pEK3Kga8zT1bEN0zLc106LXJmSgTA/HZnQYxnyzYdkCBdQeQG2dj
	OUA18Ztl3sgphJQeiVfLHC9ge31YdgH2CMdCpUbotv7AdLq4xcauLBIE97vsqHN3YMd9mj1vA+gwH
	vsGqZD2p1OTBwSivEnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJ8H-0000000Fbs6-0Eu6;
	Wed, 28 Aug 2024 13:54:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJ7c-0000000Fbbv-1K4T
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Aug 2024 13:54:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42816ca797fso61244765e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2024 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724853242; x=1725458042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKFmLO3/lL3Nmg2MZkLt12OObockGDaQF70Wv4NVfcg=;
        b=TVO3b0ZHsFB3yy4A07r7/5zT5NuljPKwXZ+/VZcxHRfns6hqRLvCV4hTaiU58Yprkp
         +L3u+CCZEGTtFyflpCeOeQ26Fb1FfB2vEx3bGPLl8PmjJRancL38tiA8KZzC/dMNomfr
         TqqRPhghWFyGtFxCTyFxm0ikKq/zB6njS3Zh6O7wAM3laA8iEa7jGyaBblyG58RBuMvc
         HpFBAVq92AWnF/QKowBr8OXCEfSJrzxbakj0TTBXX0DndXA7TnZT0HfAUqLVH7aCZscw
         mwUH1iqssKrgaZlDMs2R0+AvYhUfdR80NAthI3NUEEhT6FGIRa1MhDGEFTyAvpp+X5s4
         D0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853242; x=1725458042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKFmLO3/lL3Nmg2MZkLt12OObockGDaQF70Wv4NVfcg=;
        b=T67OsFhumuYK1Ia3+ucHE48g/lEykeOUwJHVvIOy3tN/upDdDAuAkW9Rjunuc0YyB3
         YTfRxMn58CiDcuvSH/CDBdk1bSdos/Yf59oM7ceJOo/zEMDouZxuvvnlrbpMoWbmmQ60
         4O8TP8zspDZzaCD2/at1xZWnoCDL3aYBWdWEECUQqwxiEHHTfBve/Ubu/4Oi/IWOLY+9
         2Mx5u2h20WIQRKHVoKcEYa/VD3u/2R+ONtJIye3TaKlRbpNfYRIy6d7NSnxjq+U/9MU+
         WZfnu4nnFqhQFHrh55TG5groB1cyPiKIc4DkEGDzNlUKIgNV86fMK33vBh1zvnOhWblG
         uhLA==
X-Forwarded-Encrypted: i=1; AJvYcCVfSRKES0hI7VmWPTA9OzsWYInS2zLOli9jKg6XHKc+NLe8/LsvBNXk7Nk+UfH6ejDnPEhUfJIdXmZJuj7o@lists.infradead.org
X-Gm-Message-State: AOJu0YzFpHIywoylKQDb6CNJRyPbqllELX2Fyhg5pkKjKTKrT9GuBITj
	3ouEYe10cmK1uXvAnd8GpfHVTNbmjbn46cjqFaq5xCe+7E+d39y2wrgOLs+RSAg=
X-Google-Smtp-Source: AGHT+IHSwoWHMFDjpKFcK9pcwJPtwmfEIa1A/D9/8Z2Dvd6+CqPWbqEAoRbKZE5vSyxTCHeL3rK7vw==
X-Received: by 2002:a05:600c:19d2:b0:427:9a8f:9717 with SMTP id 5b1f17b1804b1-42ba64c2453mr17313295e9.0.1724853241539;
        Wed, 28 Aug 2024 06:54:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c44asm15613395f8f.34.2024.08.28.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:54:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 15:53:54 +0200
Subject: [PATCH v2 1/3] ASoC: dt-bindings: amlogic,axg-sound-card: document
 clocks property
MIME-Version: 1.0
Message-Id: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-1-58159abf0779@linaro.org>
References: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
In-Reply-To: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=H1c4ha+5GYzDLEbE4i1lNMGNdBCv90PmwIHjIeK7TAo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzyv2DUmjHipIUmDw1VvFv3gYyKSp37htJ4T7g7y2
 Yy5W4c+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs8r9gAKCRB33NvayMhJ0UQcD/
 wM1sahnvh7BlHNGmJyn8QxdB0ucze7tbl3ftwdIlJoqnyAF9V5NGDbe15HkoR1MXxiIICMBEVrKl/8
 +q1dz5aZMfphY7lHShsY/MdZ6lNm7kSOSU8kM9L40Nd2XOTkr5PU8mfaONDidmxwC/jFiPHE7ilFpQ
 C5uYMvoa84cRrhXVk4uMPnkA8w2qybW+LfxiEUvlt5fNv5CkDlRdogs14syofwQdCNe9ezW8UR5pLY
 ivKIGzTSD3CBNUsmnzRx3w2wFgQ9ZJ8Aca9D2feC1G/3c3CRbWUzvs9WkzKYY+XEYtECJRoWJEx9Ot
 8yZT/colrVm615sewPkKOMszEzWfm3Rc+bojYiiIJTIvdAQDv/VUvt+BFXdfkdqdIyvLhVvAhp5+Hu
 ch01cknvRXXb5EPJ0lu+sKGMnJ7KWrs20e2kJRp6HLRkIhKpvDrJCWL6Kj/FWdJcBh3B7TRqbDuycr
 BVLF/PYIv6xGoCzxwKihusUc0faG2WzwlJybQkrBoxdkM2lYyR90TlII0fuBYAGEcunlDs2Nfs5JTB
 2FFrFaM/spiPI9vvfhI5tr/4jk+Z1qIXo7lQ6PLam6VRz2jnhGMs+fsjnuxYibONBgsQ7T8nprvCkz
 wYDlC5p2qBePzz82BZ9ZopTxv1KqASLS4YV4Khg06DsRsXdmrk1Co7mrATag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_065404_400218_243C1473 
X-CRM114-Status: GOOD (  11.22  )
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

The sound card design is based on reference PLL frequencies that
are the root of all clock rates calculations.

Today, those frequencies are currently specified in DT via assigned-clocks,
because they correspond to the basic audio use-case.

It makes no sense to setup clock rates for a sound card without
referencing the clocks for the sound card, mainly because at
some point more complex audio use cases will be supported
and those root rates would need to change.

To solve this situation, let's legitimize the presence of assigned-clocks
in the sound card by documenting those clocks, as it describes a true
dependency of the sound card and paths the way of more complex
audio uses-cases involving those root frequencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index 5db718e4d0e7..4f13e8ab50b2 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -26,6 +26,13 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

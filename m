Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEB7C53219
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrpyiXGXvRYMImtAUV0g2nqEf7xs6VYprMp8sfl82F4=; b=pWQ+PRkj/l3poL
	ELASj+S03sNfiyeO4zSx5B+MEB6HVTeW+99fEBJACpord3877IbkDVq3RXVTwaVvT93P2K5cfko7z
	A2IunSdBHnPYRNNdJv6FqT/Dz+n79+mbj/5VSOI8CN4b5P/4JkCzQhFzguLuI2hlRDNEFQKySxqml
	ByV/OIU4Qk2ZgRbtXqSvWhRfPVBBKPvK2ioLKy81wnp7hhXS1aQBHFD3VKVAbuJ1n0+qIsnEKhR6q
	6K3K1rkYD6XX/89yXbJIg0aDma2i2sj47OL5Yl28N0n/vWmuWcpwwedjbanAgFCEYmynWpOUlVm2y
	8uX7RcNCcEILrFqMRP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HV-00000001Zzx-3te4;
	Sun, 26 Jul 2026 20:17:05 +0000
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HN-00000001Zvj-1ZVL
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 20:16:58 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-495459712d2so6497255e9.1
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Jul 2026 13:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097015; x=1785701815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=H36Goo1LGha7xf58Ufj93NpB1eDe6pEQc4Ku54Cuj6U4LS0lo557TMzSAVl6Y8dLiV
         WOQp7O3jB5UVMX05swt3IhRQS0O1wcPsBe/GUgC/nhqPzP2JoFUxfiUrhqw87QX/ohRm
         YG6p4lVVRoyCea53dsljUd6RD9gD3NbHnsxTk4gTOT5+U17eXLUL/GKvNCW7KBC7Y2gD
         6x/zoACvBdr3NdRJ+fCi54HGeEhflJNa1ENGqHd/JnTjCmZzBF0v0wBi2zS/Fgosi1tF
         47o0vCD/zASkRbT7iwaRA3/MFDxwxsO9GhR6BPm4PCG+GRGtzNsCyIK8Z0pKPz3hLH4p
         W/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097015; x=1785701815;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=NrLPV9p7w8cLQwf5IERrlXLp4BG+EzC93p7INaZxbC79YOZ7nHCGoTr1pd7eZ6iEpK
         +iQ9x1wKMb7OiL08xALsFTIomX0/5/tyCfjNF/bftPod2CmBqhtveuUG1ZYhVr02Zs4D
         83TNJmemLbnSWs6ZmChmfpDjyrumrVcXdL+itk2D792Qr7STGgnQhQmDWpf2rtSwo2c2
         LRce3i7WFHpVazzOciY55Xc4qnTjka0yQzV9cHTCsGEmc1Bsu8XPpG4qAEsiYwi9e0Fp
         OqDQeF4dA8d0lsFeycOJvenVWLHzipW+zvfW17ek6mq+7N8fJAV10/WGnzdI4VrHENi/
         GY1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoN4Dsgri0luZXI1OM2T8tHECXJaUHNwhjHM+blQaK1AE/UtEM1hneanzVcev06Vl/aOcQq7Acvj8pH9Xz2@lists.infradead.org
X-Gm-Message-State: AOJu0YyrgBbCv4hw/Ct2vCMuSOJnbQC2esrCjspZyaFVZoVWXfPO7oLF
	f7AmVlLl7b6ICCwLkv8u4y5iACOeUIVf6vNH+wneuvGSOCV6ayuZfCae
X-Gm-Gg: AR+sD13be0dFzgQ4TW02dqqRU9acd1ak+Fm4GDnvA6K2PpkDXtRl6YxwhQOYOwMNVfI
	c3Hh5uOMOyBBAjGEgW2uGXh72ujCN5XClkxDO8fve0pVquoK1khmrDEt0dWPPDGgP8wWV471JLV
	tqEuOQ4PNH6WhN2ehhK/rH0LJvCTR87TZ529MMSrmA6T4TWflkpxj4+yCt4SYZBoCKFdU7eeYyb
	eZgEvImEhQalkJ0LjnKDi8VkwejIEmykpkX9WYWNQ9dU/uYO80RG2ytvHuXbcxpztXGrLCyh86o
	Resaj575dJ3TJasXwY7/LOhQjPN/84pK/PYT0XTxV4hFsPg9qn816UDekiNQe8UkIeyS5rxZkx3
	UkINh3PwkH53cbtCtdCrNWT4B1qAdoExmXo1t7DVJwhm25ZQ5YP/QizUWxC9HW1dJtJM5IsyytH
	NxMZnKByEctXM3Kvr3kkna708mzlCS10+7u/GViw==
X-Received: by 2002:a05:6000:402a:b0:47f:5369:bba with SMTP id ffacd0b85a97d-47f9fc901e8mr7976564f8f.15.1785097015393;
        Sun, 26 Jul 2026 13:16:55 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:54 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Sun, 26 Jul 2026 22:16:46 +0200
Message-ID: <20260726201647.264108-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726201647.264108-1-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_131657_442313_10432D44 
X-CRM114-Status: UNSURE (   9.13  )
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
Reply-To: robazza.alberto@proton.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

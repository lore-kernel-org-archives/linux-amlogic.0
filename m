Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A179DC30658
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2024 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r7v3cgcbOt3pCdhL4sV8JZU69m7BWFYlX+ZItQNs6dA=; b=ADKE+OPvGpIVn9
	4K634h5pp97BqdQRhQhZ/8BOkoM5/W7NaVqhcLIJYthT6rLArIWu81htO2tNjJOHhG0qMaIFZv522
	hHtPlrKpVvBp+UmntgwfhXeAtqSfcVgAE1z1qSY52juKOMBIVcLUG1YslNh6vWPUezuRS5zM6XcX/
	YNG5JuRZQ1eLu2QaWoMWP6pJCnd8pgq4OPaP8/r7RbinR9Xa/v0+3mj4gfyNS9aieJRoj0P3Q6L3+
	kk6BSPMyrgWdBEWmGGCcDjORPSJ7U4i6sSvektrorf8HZDjf7MPXM/XUzPzGqiZYvnMR3wEXWh5oJ
	GZv7E1wvO1MboSVuKO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUYm-00000007OCy-3oZ7;
	Wed, 26 Jun 2024 15:27:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUYh-00000007O9p-3fx7
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jun 2024 15:27:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-424a2dabfefso20487445e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2024 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719415661; x=1720020461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jYDKthMr8PlU7RMNm/cVX+jCdaMflBOcufutTHJLPhY=;
        b=tb+JQfxxV+HIlKcfEArQmm/m5qa2oUOcN2TP6TpoeVEstYgcvERXkocZ1byx2s9rBW
         TF8Ci8tiNm5++IfbTA1TCTkkvTsjI/VwmcoYplmJG4Vxb97h4ojq2xb3eHajcL8Fm88c
         owoWhtxImJ7mQY/Fzja0AJK4yxvTHDfgGE+oWDSKNqYHCfod6anIWTaAckw87qIfHREL
         UZPIENjHnsrYrAblO/fDJavvsKijGDxEZCjTmlaUNdktkp4yVJgeFaTEcH2G5hGafhtJ
         IBcg+rNGlZ+HKcnprv+q2OQES1Ab4W6cqHZ7PK8DRJoR3zYlp0A7In3Zu0jfZLmwiGmu
         K01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415661; x=1720020461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYDKthMr8PlU7RMNm/cVX+jCdaMflBOcufutTHJLPhY=;
        b=Tt0o2ZzNpNw4cU+30D9k4aLn/h60fe8Zc3mZPDOKdpwBP3HzrCjlxuZa13FZ7TBWy8
         zeDoZFkizKJHr2WLlJ7n149ga52XyGWYu7gAmjqFgISRaQ9pp4koIrc0/qhfjWT9SGSr
         b3gXI40Z+u5emF0JPsiWfNd8SSPeCV140kctt4fm1xA3dvq9ymhIqB3CqOYJLCv9XiRA
         SPLb7I8wRD0hH1boJQ/GtPCO7bb1EOVenLRLDN8ClBZFOgq7TVM94kCq6zIZbiBb6Qq/
         fMQvrgjEmgLlr1ht1JHZJc1xWkQbEB21MajrG5vTpNRb/EHGxOetX40BUSms7cNk+6Hy
         q3KA==
X-Forwarded-Encrypted: i=1; AJvYcCWwiq6xL6TVYvEthQaAMqJs0XY+P6xjHZgATpXjIpkZ43aHjA+ZAG8iy+TK6MGsCloTe+USsjzogDEg8fvR0Sxr2dU5JCTY6pCaZF/emYlpE2c=
X-Gm-Message-State: AOJu0Yw/xYXnGtr6CjKeSUtw98CEvpgyxTyBKK+atO/wiSEA8Oqit86Z
	vhX6z1NcsSm3i7o5vFnP7Kg8IjpEh+PbGDuqMYfSQYrNYfNqAZEUG0DV1EpRszg=
X-Google-Smtp-Source: AGHT+IEMQpIEwx0dH+XhPkFS6EJi2CgtiwjD7ua3gdSKxmKrlk4K/C5rgHIgRTqFkzvhQeFAcYKPsA==
X-Received: by 2002:a05:600c:3514:b0:421:e7ae:955b with SMTP id 5b1f17b1804b1-4248cc3415bmr86578825e9.21.1719415661304;
        Wed, 26 Jun 2024 08:27:41 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7be7:aef1:af9e:fff6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4249b4233b3sm42321675e9.0.2024.06.26.08.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:27:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/2] arm64: dts: amlogic: handle hdmi system clock
Date: Wed, 26 Jun 2024 17:27:29 +0200
Message-ID: <20240626152733.1350376-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_082744_036446_93C33103 
X-CRM114-Status: UNSURE (   6.22  )
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

This patchset adds the setup of the HDMI system clock for HDMI Tx.

This is another step in cleaning HDMI Tx and its direct usage of HHI
register space. Eventually, this will help remove component usage from
the Amlogic display drivers.

Jerome Brunet (2):
  arm64: dts: amlogic: gx: correct hdmi clocks
  arm64: dts: amlogic: setup hdmi system clock

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 9 +++++++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 9 +++++++--
 3 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

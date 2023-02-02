Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6A3C636D7
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 18:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCQspC31ZuaWEOTPJIqLNFUbjDJfV8TMQuoT6kvAGoM=; b=ew/1jzKXhwxzO3
	jk4TLbgGUst8ogaK0qvvzEOYXoAJmngxYsVET+JlsLXVPHjgppf3XfRgpzQw2JxHc8DbQipvnGxkB
	M+ZvNf0CWjdiDxq0Z1e9xXqNtkCzg9wWuIph7GKon6CWfjY7tyh5y73pnK8W0h+MOKe0CG3oU5Dqk
	SR4ad9tI6WE2jODkmoG+CCcWT2SqQQMCe4diR1jyQur3Q/dCwrgknVo9ce8pZ8lCsaV0Jl3j2Ds2F
	RA/dAjElK1i+aW9cZHOOtH6zcvA8jxWYODbBQOCO30NArTQmCpRvE66FHqND4Oh8gydd1AI3TxU/S
	x9a6r+HgTA3Xm6lsdyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSo-00Gy47-RQ; Thu, 02 Feb 2023 18:37:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSl-00Gy21-NP
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 18:37:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id t18so2578089wro.1
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 10:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeIfWHDa2fvM5jUnMkL8MI7fcZ0bv0i4OOCgMKL446E=;
        b=l06A1cmXwgKENlFdGLp7sC4/eyJqhQGFvt4WqG9szuR7KAzjP3ilZlD2hOQqUJNRqD
         y3ckO43HNJ3hiNoIuABaBoCYWYdHAr2oVhJXGyhd0e3wQfZdsBGSaJJleNkYc+7imVdc
         jQrNTRkmnSzPebl/3WAjEkdFAkMP81O7guCTHQzCMtxl09H0Q2KgM7/MCLQDnpg5DCBj
         +dGns2SgfBT/jHvrCuq1PRHBINCr7tyy/gk/Erwt2XpcxqtESE3Qz8vzRbe/KQzjqJzF
         DRUXob7GENdxln0PH2KRCPhBsLN3/lzLRlG9s5jKXszXTeTJY073AMpEBT8ZL6ApjJ8Y
         xzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeIfWHDa2fvM5jUnMkL8MI7fcZ0bv0i4OOCgMKL446E=;
        b=pl4gpQ5ys3nJv5EE33kDHFu3fURYaU6kHea5Sl/9/J5LZsna9bxoMqk+eE8j2NDiod
         PemYIGsBLtomm7aVJwD7xwWPaessSPfu2YY6iM8QxyVkw5biAv+gFjtLZ+Kgi6fKVVhI
         PQnxHK9QKpCl/6fbd9GIfDQ1PaABIg/e8luNULggLIEGkSU2SXaiqzlHKmdzWmeRLjKr
         QfdROJ/HmNlXGAso7xRFohbXUnckET+vvv4QyWUAh4hNUjvJfAFaMxS8uKdI3Tk1iF5e
         Dm7GVnguWlXwH5tdC+MkN/GRNnp1kBYlLd7eD+UsmZ0ZesaDvZ3WRXD4mQrPh3F5etmf
         G+Yw==
X-Gm-Message-State: AO0yUKU76fcDMOOdVxR8I5zvnXTkRhzYFvhEKsFNv1AvM+dcXKQm/4Wh
	IpfRUhIRlUmhsLfQNyiuTFYZjA==
X-Google-Smtp-Source: AK7set/gl7mkCo0fFqVVU8e+mU0M0fxQBGITq/co13H8UNB+GuXOO3uWbLmrv5x5yRG3W+gngOal/Q==
X-Received: by 2002:adf:9c8e:0:b0:2c1:28dc:1561 with SMTP id d14-20020adf9c8e000000b002c128dc1561mr6380662wre.44.1675363050459;
        Thu, 02 Feb 2023 10:37:30 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:37:30 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] ASoC: dt-bindings: meson: fix gx-card codec node regex
Date: Thu,  2 Feb 2023 19:36:46 +0100
Message-Id: <20230202183653.486216-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_103735_779420_25B2B910 
X-CRM114-Status: GOOD (  11.06  )
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

'codec' is a valid node name when there is a single codec
in the link. Fix the node regular expression to apply this.

Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 5b8d59245f82..b358fd601ed3 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -62,7 +62,7 @@ patternProperties:
         description: phandle of the CPU DAI
 
     patternProperties:
-      "^codec-[0-9]+$":
+      "^codec(-[0-9]+)?$":
         type: object
         additionalProperties: false
         description: |-
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

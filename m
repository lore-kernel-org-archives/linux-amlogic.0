Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B119FCFB441
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nz52VyJHlQ7XxrxtvOWGffebGI9+eaOviGSctqGnjWw=; b=VraOHv3dTuJs9c
	SPhuQz0Db0JoxMAwZEvH2KrtWzbe7T8Eojw50j3lFkMRB7QAMHLMyVHjQxcMSBeW1vi/RqrksLg18
	cJJOy6zhf4yw5jM3MTNsMEezf1HtT1pseAGGHfu3YUeaTiiqlDLLlKLLonYSpp0AnMt96TfmLoOqR
	Xy456MmvXqkBMQqoSQh3MDyj7QXXYZ45jmXssuJfWpk1IKXXKgya+A64630BX61LTOs/vZSnBrBP8
	w+mj9ZNBtiGTKvwv9RunBhNjGXQeqbOsvY56LZlBJd5Xrj+Lf6tRBGVgC3YLxAGpZ7ZzOnR5PwkCh
	DxQ/VjvNMr6/C06l2Rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoKw-00000002cBI-1p3o;
	Mon, 07 Oct 2024 14:03:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoKt-00000002c95-17FO
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 14:03:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37cd8a5aac9so2391226f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728309821; x=1728914621; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSLxNDuYdWpagdzEer92KL4yq/BpaLG5xeJAnFgYcHM=;
        b=zkNN1Z40BY7TOUF2hUZxCEZj9i9T7cDcm5e+RVEfrBEW8jn3zHkju63uP0XWNF+4LY
         0mt4DLmU/+/iSOnU5pBxPG57mHMuOGhPe9V8Kme2vyeAXFYxTUdPTHaeoFgj1vQ+ojiO
         82LHNfw5DCUdT0l42zIMVpemua7QMfyiJC+vIH/UKt8bNOUgMoHf+GROk2c72YOb7CdW
         Sa8DJYm+okGiNTK6taRJk44lZ/HgnGTHMnOLctVfy+s4r9SBxz7sMBXkGiiyVY/iqCXq
         VBk8ArKA7v5xDl2AEk25ip11ocAcgpFm0n/DBPqOzHTb0ANJBIpYBM19oLzOfefkW2Yk
         8k8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309821; x=1728914621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSLxNDuYdWpagdzEer92KL4yq/BpaLG5xeJAnFgYcHM=;
        b=YR08/XtfZDa/R8YT0bqjDQ2oYA6WJ8PV6E3Rr6aa7h6xpWJSNSuLxxhPJnUbecNmU0
         KKdPZa/Np+JwQxCU7fq7McV015quhAWx5x/MjMXarin0KynSW7ilJ6VzfW36qBgWcU8p
         07pyDMkHQs/AIHtdaRMmESkY9S3DuRFjRH67pDMnYz7d83CN4OP0kuxJgQ5X0Sy3g239
         xUxaZ88w74qhaWpZKWSXRK0SakGBd6XfxsFeKXyDJeztydXBq3t3GGMKDeGlCMWOIgf0
         oq1sbTeuUAqta5nte9wFTPQmRpswdZ611zPHY90FT/qvmXR/SphCw5PmD40QGAp1lHtO
         pT8A==
X-Forwarded-Encrypted: i=1; AJvYcCWVHGgwJtRhoHrsBvEpWGfWJ/n4b3nR/THnn/mc6gpj+uGZSR8c6PNrAIHAelFgTrJ/QHjQ05v4mm5kF6OT@lists.infradead.org
X-Gm-Message-State: AOJu0YzZM2Tuvk1ZAGkV+SowhUpT6A3AxmPuJXHyL9s9Tx1FLrrklJwF
	wFGRy73hum26iOfH1OipN8cxSzc9lNLVn9lGv1/CvyUM9Y/MiTf4XJ5N1FFAyMo=
X-Google-Smtp-Source: AGHT+IEvaY76Nbh6y2EgunS5NO4YnfqBAs/pRm2aYkZb2LWol2ctokQ924n5nzY5hSHUuWzsXLPd9w==
X-Received: by 2002:a5d:63d2:0:b0:37c:cd38:c51f with SMTP id ffacd0b85a97d-37d0e6bcc41mr6226690f8f.10.1728309820972;
        Mon, 07 Oct 2024 07:03:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1688a486sm5857022f8f.0.2024.10.07.07.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:03:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] dt-bindings: mmc: document mmc-slot and convert
 amlogic,meson-mx-sdio.txt to dtschema
Date: Mon, 07 Oct 2024 16:03:36 +0200
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADjqA2cC/63OwW7CMAyA4VdBOc9TEqB0O+09Jg5O6xRLJK6cL
 gKhvvtSTtudk/Vblj4/TCFlKuZz9zBKlQtLbrF/25nhgnki4LG18dYf7IdzsMjMA2C6yrRNTXs
 PP3NZlDBB4DxyngpEvlGBQXIlXSBRkQzpBmVkgS7iyR4PHYXQm+bMSs/zxnyfW1+4LKL350vVb
 dtX6tWBg3AKEanvO+/c15UzqryLTmbjq/9DevsK0oOFI2IfxkjWYfxHruv6CwT7ycuGAQAA
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=I8UIXlkyqy4Mwtxfe+Lk97YCZk/oHsm/QktDgn6rVqI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+o6HBbW7RjCo+cyD/An3Cd3RF6bmB9Gj7SZUyyW
 rYH6HbuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPqOgAKCRB33NvayMhJ0ToDD/
 4tn0/fx8ukJ5zSvvWZSIZcyUsUnVIywgPK3SNYCw8Jov6H9n6Engg/jfkH2UR9NZ/kE5xrKc37jsid
 7VMNKqU749yPjO/YQQWkU+/a/UxvCzJAM/sR/ljYF7LgggpvRtySMB/dRg1IIUjZwMK9YGjpG0hlpS
 7QvlpaDjAg1grVn0dfBEpNIYfx3NtgCww/r1Hc3XcekUDMRovo9IdMfAK5E+kR2T80uC7uQMsy3LS0
 uL0hNhJJfgc9ZYd3UQAkeN2ZefcXvLNTOVuF/XYx1DRBdrMLKQj8KWwre0Y1zAtga1gUZjwJaDEG+I
 X499SgBjmWBsReJc4l9OvD59JoEFn6xJSVD4QeCC5ZZpG6vA+K/eSIBluzi+WbYf9I3qgz8TSOelwn
 sQ265Ln3+S2P2EVIS9HSDOYS/ps13a5S5ApyN93N7FQ9wFC2ZXKQ9EsuPzWK1Lh2nHJt6FaD3D940H
 tyJS2leQ+WRofTTTHd/o5cL8+3T1T54ewroxegNkNuanOZUPwzS8QPKK1kC+nKyOubtPI4Pa2l43W9
 y67MtW7uQOQ8bOqrwOWd6A4mtNQpDlFQoCJ6a6BxUE9/rr6vRMSFzXbr/bs6dvpAp4Vc5EtiM6gBjC
 4/vAURZ9Qhynb/hLSBpEc2Y4swml6jFwEMRlQrF7Qw1lN0hiMbck/k2cvVJQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_070343_348614_30C4BFD1 
X-CRM114-Status: UNSURE (   7.51  )
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

Document mmc-slot because used by amlogic,meson-mx-sdio.txt and
cavium-mmc.txt, so make it common.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Revert and insteads move common properties between slot and controller into mmc-controller-common.yaml
- Fix other comments on patch 2 & 3
- Link to v2: https://lore.kernel.org/r/20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org

Changes in v2:
- Fixed description, limited to 3 slots
- Moved out mmc-slot in a separate common schema
- Link to v1: https://lore.kernel.org/r/20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org

---
Neil Armstrong (3):
      dt-bindings: mmc: controller: move properties common with slot out to mmc-controller-common
      dt-bindings: mmc: document mmc-slot
      dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to dtschema

 .../bindings/mmc/amlogic,meson-mx-sdio.txt         |  54 ----
 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        |  94 ++++++
 .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
 .../devicetree/bindings/mmc/mmc-controller.yaml    | 344 +-------------------
 .../devicetree/bindings/mmc/mmc-slot.yaml          |  49 +++
 5 files changed, 503 insertions(+), 395 deletions(-)
---
base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-6fa70546ebb8

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

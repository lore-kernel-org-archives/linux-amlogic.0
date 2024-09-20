Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC62CF58F0
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cjFnf6hqIofCUO5MMxqHRgM9AZ+QRFUHD7a8I0rnBgA=; b=RFzuglcHUq9fGh
	88CjxpPow1/6hTPSWa4Jam8TZSqrGGIcmrnhRKLfmcILeEvA8Xhn4FrMt9EMCf7bPS3cPg4pWuuwq
	uWHrAI3rNHcm60wF0ukFMXJpUOkQGvk64hAe0Dcxe0fjKvmapRSwQydF3u3MkYQZanR20AYnmTTAV
	dlrRxBeQeX7yoi4E3AZnn1nFgA7Ff7SRlHYUjJySVxHXtBKFdA/TiUF9o0Nj5L3BzwURwyj9V7ouR
	w+ZsWAg3DizkGJSFHcQ2MNZ6VrLnpk7pHjvVKbhaoXUX0OlSzTfuzk3ucDQy9rMqZodfTsybprYWS
	XrqZpyR4i4NGSRf3x6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZLJ-0000000BpUq-1Toh;
	Fri, 20 Sep 2024 08:50:21 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ9V-0000000BnL1-3hcR
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Sep 2024 08:38:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-374c4d4f219so1049408f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Sep 2024 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726821488; x=1727426288; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtR9rrwh7DNDhn87WGlIXFPqSFnA1qNP99faPKnPFcA=;
        b=BPVQsMvTxtvt0+ZpS36xURRd3AFp1G0r9bi2Ho3L0zntHz8ZM0b4GWwpu/Iu8tQCgE
         6YvKbQijUMygZg1uITtTeCLvxahcesAjfHMrzkqNX1TRja0mIGVr2y5eRwzBnlwqGrZ8
         eXD3sTovE59k5Z/0mYFVCWSC5wwJ+QhUDWhfMVUYvCBMy6X64OGTRqpAoGgHeYZunm4P
         j8w+WlPdXnfDk6otR5IhIBrIZgFJADYISMpnsUPDoy1rCt1L0YbP+/12K/Dkv+t3bUMu
         OWQspWT17agSPTRkXWyj9uT2WibQHSHAIX3QrGJPytHaWVZGztJzgquYr/ohCLhDjCX7
         /nZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726821488; x=1727426288;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtR9rrwh7DNDhn87WGlIXFPqSFnA1qNP99faPKnPFcA=;
        b=mnzmhUKqHdO93sv0az/p1WJJnEh4CRYexpuIYI9pKzsZT40deTgkTDpQwZIs0au51u
         VU2LnHpqUMOcNDW7vT0/MzSHlJNF2X1i6ADwOyR0CZi7/AIU06vZRM8JCaQC9Y16r7JZ
         oLTL48cy00hWJn4XoHlQtDviGf1DNdyhRa/gFcuE1cMIl3y2w9Er2buroQINDYQVgsQM
         YQmHH6+UGrVaoXS/t2+cNOpRBRwoXjWQOAJ+ABUcVhKmEkDDwvbrXsYMo+ANf9VdqE4r
         IJmfBDZMasfjLvAntMGlXTfWWt4P0eQrYCsDw/F0fNbA5uuFmWNRZTyu3GB9x/QRbmrg
         QmJg==
X-Forwarded-Encrypted: i=1; AJvYcCXpkk4mpLlfq5yIRA/gkzo9aIcZxpQY3Y9As0OMiR4s59dY+jqi9lKO9lF2uPviayJygx5P9UcOhL1LLNiS@lists.infradead.org
X-Gm-Message-State: AOJu0YwNn4JohxkO+SoPIVtj727ymM8AFLJ6jBac3av37lKVSpYnCIXh
	/pD5xwo2/5Yw9Gv/kfzOjgwZEBSdONndBIVhRQOgwK8e7aXpnPRb3myHCzcgQ8k=
X-Google-Smtp-Source: AGHT+IHC6NMRGd8XrHhnl2luCm5xPyNVEx8J3g73EFnggKlMIkGbyXMoJxZmTUE53GTxvFNbBZuAFg==
X-Received: by 2002:adf:c788:0:b0:36d:2984:ef6b with SMTP id ffacd0b85a97d-37a4225216amr1084085f8f.11.1726821487809;
        Fri, 20 Sep 2024 01:38:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e2c1sm43099165e9.2.2024.09.20.01.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:38:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] dt-bindings: mmc: document mmc-slot and convert
 amlogic,meson-mx-sdio.txt to dtschema
Date: Fri, 20 Sep 2024 10:38:02 +0200
Message-Id: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGo07WYC/62OQQ6CMBBFr0K6dgytiujKexgXLQw4Ce2QGSQaw
 90tnMHVz/v5yftfoyiEaq7F1wjOpMQpg9sVpnn61CNQm9m40h3Li7Uw8UgN+Dhwv6bEg4PXqJO
 gjxAotZR6hY7eqNBwmlEmiKicIL5BW2KoOn8uT8cKQ6hN9oyC2zxr7o/MT9KJ5bNdmu3a/tM+W
 7AQzqHzWNeVs/Y2UPLCe5bePJZl+QFqNQZmEwEAAA==
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O0gR+EEyIIZGwIA+qtqCfN2wuQii0s/XxaptJOUZn6o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm7TRtbOtlTlRm40YRznfQ/pndGMNieGeHGev29+pX
 b3EWRBCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZu00bQAKCRB33NvayMhJ0aEhD/
 9NFslcvRji8i+vGYoP/zVBiOQLVQ+1bF3mEoBRIY/9l9X1Z96h104J6HbFpP5YloCWA+torFEbFCdd
 7GbqjY+gr9oTIwyX6gZFAET6YQHK9nC4smEFUPluIgBLLbvPeh2ywK79NAuAQI65oXE3nsmpTmiGVe
 HOcKq6e6eODBOwq7tTllFpo/KOLlu9SGR9Vct3xKOykgUYwrcndnYzLlpiN4NGbvbZgehY65zY89EM
 D8LgChW+tC8+KpI1AIbuusJuoVzBuRDEpzb7Qf4Qi4e0kuGI3ZSlwFq1TtwaUaolYOaraBh6VfXwy+
 BMQPYA3I5GyYrC3J+bcc4Gtc8tms6RhBFgqPNTpXB8whWCjhcFH4yi0tAdR1LFz/URt1HyIIdxkoQK
 /x+tyCF1waIcIWzxRJoXa/kZPp4+sH6tIno952A/X2Bp3IHivQX7jVUJ0X0UHYeYo5+E+IpJTiFAoF
 29sWOlAr+xW5P7WYWZu23J37K4Rg1xB72oBGbZWUhkHppg8ZnxIPq91QGmKGZh2xN+NZyAqJY8prkn
 dYGhubRZpskGLKMgyAXxNVxZ78GqQeZeMv8/Nijnn8CbKAkLsbQLcZ/3gIx7D3BhDEP7qp5+zqsWqi
 zY/J6h8Sukf1Cl0C8ePVaYtX5PW15mqgRDNJBiMHbyuawinmIAxi9aO6WVig==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_013809_982443_BE53C0C1 
X-CRM114-Status: UNSURE (   7.30  )
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
Changes in v2:
- Fixed description, limited to 3 slots
- Moved out mmc-slot in a separate common schema
- Link to v1: https://lore.kernel.org/r/20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org

---
Neil Armstrong (3):
      dt-bindings: mmc: controller: allow node name to be named slot@*
      dt-bindings: mmc: document mmc-slot
      dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to dtschema

 .../bindings/mmc/amlogic,meson-mx-sdio.txt         | 54 ------------
 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 96 ++++++++++++++++++++++
 .../devicetree/bindings/mmc/mmc-controller.yaml    |  4 +-
 .../devicetree/bindings/mmc/mmc-slot.yaml          | 40 +++++++++
 4 files changed, 139 insertions(+), 55 deletions(-)
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

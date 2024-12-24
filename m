Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EB3E77188
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2024 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VNd8glKBGRUBng6aS+bLICfPVrUvBCfR+2VRmTuWkqw=; b=O33L6urA/cs03J
	P4U5H9RxkBDpAoMBOb/CweQtGtQ+nyGgZn9N9ANMlP69eDS7QH8iT5CsrsTvTGFqpckK1J1yyLP1e
	GcyXr/EYVdz2FR6vS45xQDdxtPvnENdwa7HNXge8CWM+nBAfSJAKg8EIb4nkBP7sjPFBHB6sMrZYk
	wUPfiPKjqfX25gujws5aWUaMPd/ZIRUoQKxV2kEErpWJO91dzBo0YDzzmjkarcEEXX4Kpu5TDTmEu
	4Vm/pRz2oh+0CupMOH7x3DBJ3CzeUTwFQTVoCEvnDV1HtmfLEjcK3j2EqsKhqJ3GjiIHbwupSH31o
	BHFBWC9yv1/0OmUH5gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5vj-0000000C8li-1IPe;
	Tue, 24 Dec 2024 14:30:39 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5vg-0000000C8l1-2L5E;
	Tue, 24 Dec 2024 14:30:38 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso1077287866b.1;
        Tue, 24 Dec 2024 06:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735050634; x=1735655434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJqXDK7LRZXJlrA7vQMLZbR9wNv56Gv8NF82RjcZv4Y=;
        b=OigUigJgypopPhg2RATC7yktMMgt41ScSTt4cUD1Gc89JoCt55w7fSlsi66BdrrnOe
         /Dk5LejJdwejW32a2Pktrf5wC8+SJjMB4Lm/LNEEtzUga7nTD7KPLEKJkrhwm9MNDZ9N
         CY1gs7wI7iDMs1wjQ4NpaXGVj8/v5vypYitLke7K5ATZaic+VsR9K3C/0eDxEJuoyQ8J
         MTzwOhg50GE9fHU5ex3InMig3zdmi09oSKhuPqefsDjlKJYp2aQ2/8pLDcRFSNS0Y6mz
         Lxeh9O6/Fu3g5JU8QEVszAH70in0LIvbVzmhI6cwp7RIVrviZT7PXmHr650IFfuQX+xL
         c1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735050634; x=1735655434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJqXDK7LRZXJlrA7vQMLZbR9wNv56Gv8NF82RjcZv4Y=;
        b=lG/B2YMrYuQEUOBEtG8W6in8NJ7uRcCiPdPjDFw6cXuWCnG7luQCLrFkkmpupwRlCt
         BQvLDuCXub1Jr2ImKzqwFIzxRU03f/nTzEGRGMqRjoMEb4l23PAl+TEsBeNyTfyQsR+x
         8poDPbJyOVt/s/Hw+HpHpM9sjO4EiynIS7uUvjSnOoPsPeqodXfZ/rhvpl6jf/tNu30W
         y418OJXX9+jldEHtn3uI51yEsV5SqAFxv1tlSk468qbWFxlbHcHcysNgPvRjlqC744M4
         7gRHsyeSQSHIRSpiqn3VyqO/aItK+k517nUdzq5FfQw01jY7yHXu16CWBNaS+glfRk2R
         Nkig==
X-Forwarded-Encrypted: i=1; AJvYcCUcItIYRkvGX9R0kjchR/DbZ1VRwza89vOF8Q1O6vJLbg/NGtCpFpRPcD5jcxKrhegqdO2TMMz76ua269df@lists.infradead.org, AJvYcCV7Kr9V8QmuzOM1AhYOoPeHecVK09jrejLN65yXuI9+rZAfLpP9DiWzIsZxGLxnHJr+JIXmbhnPLL0KbwYgIZ/09w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6nf+BPT0b0ELClFkqorqgD/b3zO/8DnsmDeZYYLFFzv5SNvbF
	MyaY9OBEoXZFN5M/AcJY22YyTLRymDNT5+l5aOAF89gP5HwbHnPB
X-Gm-Gg: ASbGncva+cZb9nMRk0ds//jwCl61A7NpFvmz/BAmQSxswYX7L6ZsYsbGGirLMVfvvFm
	c0ovekoKQ2Wc38w1DMP6uh61uh1KEbdYqNkwHjEv+Gpk6/UZE/NvV8BAK4lgytZDjLHpg/Wg7iR
	8nfCVFachxZebwDA539AJiM3zC1I6f+GnMPrTsZ1Ss1G8lkJjY8xWPk1GoUIeaorn9MmAYkm0wb
	ui9W19Yx5dkDPEsGJa01rPuv0bZnOjv9YVYH3Y8X0rDckXpaogQE4Qe7+FWzpOc6UPY/7VtFpfm
	6Hu9r+hB6uZujoxXpFwbtJxrzuq2SRCWMYLva3/81x2b6UXucYNRi/Roqv+UY775CZP5sUgKLV8
	OjlxS/eU=
X-Google-Smtp-Source: AGHT+IFNUBSWIPUOtbRSHMETUJeoCqYnm9NCyL9rlebTFDHnHcgX7dU4xV3LQ/s9gviB2dcq3z30jQ==
X-Received: by 2002:a17:907:6091:b0:aab:ee4a:6788 with SMTP id a640c23a62f3a-aac34218829mr1934689166b.57.1735050633572;
        Tue, 24 Dec 2024 06:30:33 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a5d7-4700-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a5d7:4700::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0eae74e4sm658827166b.91.2024.12.24.06.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:30:32 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	gnstark@salutedevices.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/3] iio: adc: meson: a few improvements
Date: Tue, 24 Dec 2024 15:29:38 +0100
Message-ID: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_063036_603737_D893A4DF 
X-CRM114-Status: GOOD (  10.72  )
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

This series contains three improvements to the meson SAR ADC driver.
None of them are meant to change the existing behavior. The goal is
to make the driver code easier to read and understand.

Changes since v1 at [0]:
- drop the patch 2 "iio: adc: meson: consistently use bool/enum in
  struct meson_sar_adc_param" for now as the purpose of the fields is
  unfortunately still not clarified
- add space to tab conversion from former patch 2 as a separate patch
- Cc linux-iio (which was forgotton in v1)


[0] https://lore.kernel.org/linux-arm-kernel/20240324140429.5484eb54@jic23-huawei/T/#m81d92c2192de1936646543543501d8a62527da8d


Martin Blumenstingl (3):
  iio: adc: meson: fix voltage reference selection field name typo
  iio: adc: meson: use tabs instead of spaces for some REG11 bit fields
  iio: adc: meson: simplify MESON_SAR_ADC_REG11 register access

 drivers/iio/adc/meson_saradc.c | 47 ++++++++++++----------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

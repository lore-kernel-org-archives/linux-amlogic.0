Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D5FC54E58
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2024 23:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kYHbd6ha2nMkiSQvDPuq8iVdWfsSyY8HA9DTFEkFZmQ=; b=dgiSoFI/mx2wFi
	CIhtdaXBvb1dxdORQyCqbHMg4eMw0E8S9soZjMMUbkavliZbrfrDnGco2UrGSwkKjl25bB469gTG2
	PPKQUXLVClfoEoBPtT7kXxtEHLvgZh5FJ6O0UAlM2yBfDhgu2g2K7I+T57SBPflc7O1vbUS8FgxPg
	kDpE/bSEGDPT0ABBS+FhOk53VhC7do4htrBcSY1rhUeOBve2fl02Pbd1Ufju5HZN6SAzhJEdxbgv4
	Y9dW41j07npSPOIuE0Yga7U7lL68zT//8/BKSoLu6ho93kyVVqD96uSc4fX1mk4e9LcFtI2XYAnhu
	1mm2hzfa6GimTivN1FVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAYI-0000000BMpi-2Bgi;
	Sat, 23 Mar 2024 23:13:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAYF-0000000BMo5-1L33;
	Sat, 23 Mar 2024 23:13:24 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-56bf6418434so964324a12.0;
        Sat, 23 Mar 2024 16:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1711235599; x=1711840399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrvorSrj3R5tK1f69H+evaaHvKOK8nrgbhXtF6WO724=;
        b=YACXxobWBupBSv8z9h5hj6fw8KTdfRVXFDfLfAnrUl6id3RQPUvt9FhLYameL9zU/N
         eO20GD8fKy4fCkuPKem7fcsT052k1bFEXfUFX/hruFRw8jV/udGjAgEzHaoipZnLNEe8
         uCnP91LQn06J8bhS4lXXULiCIRSJgyKIjjSMpKxDOmvSItzBJhJKijB9GnhGH4GVexz/
         oQFO1Jx8Fa1eatluWPyqFcmtGwcyw/O1W3LEHzcnzyEJlsFNDSjdWnjlJ8vEq6UPogP2
         auw3qLutyfxJ8gLDjTWCS3ne9xiqHsTnZhVsH+2bmPC/vDiMsiKabBLcTzbUlL5Z53Ar
         1M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711235599; x=1711840399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrvorSrj3R5tK1f69H+evaaHvKOK8nrgbhXtF6WO724=;
        b=AXy0q+xngTIDROsHAioT2XnmDHpXjyNIqDvRRE540ghktz5MIEnA074hprqayth+DS
         EEaRhVaUM0fS8wGS+VnURJmPkKDbYC7XBg6nnI1qkN7Q/tAHW/aBPwkcRlUj1HIjMztq
         Vyk4fG8gsHMdQ/KzgQrIWyFjAMxcEkf5srkYnMwFX3j9ZDbK+zHW5jQ69worWACZZTtT
         //HRylmqhAsNgRyQY/JbI6o7Y2uXoB25AIM7WZBsUU2lwT6qjgNfsGyQTZ/BLEYWnsg/
         H9sOyRgLiVNeHzlG1+xv0MfbKwSVaLvLz159vPll18p4UVEJGDQmFD3SImA/X9vPBCbF
         ysTw==
X-Gm-Message-State: AOJu0Yz5AGmuJSCZyVSWdlVDzU/pE3O7NKm3VP5ppydlu4l8weS8pDCz
	9UFzs2OAgXPXvWt93YyiJY1XvHo/UZaleinX9piU+czhIcJUEROCSXkzNx33
X-Google-Smtp-Source: AGHT+IH+AojyL9v3CgNuAW307hxoTEiHQ1ED/2Gfk0FRPouGHy9fr+IiL2v5goSA+sKwaMRelHoSqA==
X-Received: by 2002:a17:906:1416:b0:a46:b76d:dc30 with SMTP id p22-20020a170906141600b00a46b76ddc30mr2106551ejc.44.1711235599307;
        Sat, 23 Mar 2024 16:13:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-6fc3-1a00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:6fc3:1a00::e63])
        by smtp.googlemail.com with ESMTPSA id h10-20020a170906590a00b00a46196a7faesm1375116ejq.57.2024.03.23.16.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 16:13:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gnstark@salutedevices.com,
	neil.armstrong@linaro.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/3] iio: adc: meson: a few improvements
Date: Sun, 24 Mar 2024 00:13:06 +0100
Message-ID: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_161323_413227_686C4BAC 
X-CRM114-Status: UNSURE (   9.40  )
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

This series contains three improvements to the meson SAR ADC driver.
None of them are meant to change the existing behavior. The goal is
to make the driver code easier to read and understand.


Martin Blumenstingl (3):
  iio: adc: meson: fix voltage reference selection field name typo
  iio: adc: meson: consistently use bool/enum in struct
    meson_sar_adc_param
  iio: adc: meson: simplify MESON_SAR_ADC_REG11 register access

 drivers/iio/adc/meson_saradc.c | 78 ++++++++++++++++------------------
 1 file changed, 36 insertions(+), 42 deletions(-)

-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=38m5=BZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98544C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2020 18:14:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 624AA23B6F
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2020 18:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GRZjH28j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Gdr6dMre"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 624AA23B6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mbN4Sk4eFMOPSgaqZjocl8fQUYGgE5zUyUQJy/O4aOo=; b=GRZjH28jj90M/MKVR4v3azNBx2
	ZkJUXMesU1v8wOdYAh9TvJEtlEtvrGxizcqeWBGbiYHNZiJuV1DkmZVSX4s75QRdF7VSQOj6wiGos
	Y+pfyX11IStpe0crdJP4rA8phoaUSKfVXCoYwv83R0WTr1ZFreUROLHKftTdvs6X+zPixRp9ZE36x
	cIrZkCjSxemvngCA3NRXBHmE1f6oLkScTn7omIqLMwjO3G+7wrf/u9ddIOiBV641sX+ve+/tlNQ/N
	m8gZGpceJXDrpC63JEPCPCI1Y2bYfUajq3qG9LAanX3YkAB4/Em0+4OZPWHWF261IM2wCNDTBAf3q
	sQjo3S/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k70hB-00057A-Mn; Sat, 15 Aug 2020 18:14:21 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k70h9-00056k-M5; Sat, 15 Aug 2020 18:14:20 +0000
Received: by mail-ed1-x544.google.com with SMTP id bs17so9201330edb.1;
 Sat, 15 Aug 2020 11:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uINicZ+DHLLF2gMCG0S676L3/FxAXJzjhmV0ZOtqSWw=;
 b=Gdr6dMreL94m8umOuQw9Gnk6ALyI4bOz2J1jkX35OCYz3vZKzzenUPY7Ou4pt7B8ef
 YJsst3uPEBlvpkwDPyewbZgJgOjgiNwSsczgytdaT+7aoMkT41HAqp+y/SVjxqTuRE0K
 w2TcKieWe9IP4o56pK8MOrDoPjfJdTjQtaivDkmWUJGgNvm0ieiOkqHu6StyMDfph4qN
 xpF8wCfpRrbEf5ADtrMk6uvpQsPpO2jlcaUdvc4fRSxf2A3KkfZICjMcQYaL5SYfqSsq
 ZDtY2tMvamx8CHjoldemO2Qx+I3oPj8zYp0ulm/kGNiz+45hySJIQTTeji3rPUIAUdo/
 r05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uINicZ+DHLLF2gMCG0S676L3/FxAXJzjhmV0ZOtqSWw=;
 b=O3D2I0Idhs3qfhRNmPVT1c16lhVnyjblVopoDdZBbUS1RAVS5Zrkz64jXOcd7JZE05
 Nz5XDCT96iP5kNdu5wp4h9SEk6/NIfetXk37tiyjgBk4uBSoK3/WBp2bioKuIEW3r5B7
 5wE4DJ4VQEfwT8MUOm8LiiRzVCHKOMxCh8zO6vODmGTp4NfG9Ou4YCfEdH8p3S+C4Zfq
 /snNPX66N2H56HOonzP6smw3OkJBOOb/V+7rMYlPPXxjxv4HAftBDaT3tytCTk3ujnIW
 IG4BA4v9oaobIwr/ltiJtfItvSyGw6iZvZi2TmZ/tCxnXHYQbIuKK2I1HC53X23UylhH
 USCQ==
X-Gm-Message-State: AOAM533G99uECqsurTwhgSl9tya4SlxMEOOValdMklXsAXu6lvQH/P8I
 d1CFFuZpQPZTyqGkU8rfmYQ=
X-Google-Smtp-Source: ABdhPJwUM4wX2FiiLD7s/Ocw/648bw8oWRk3tLISpQebRyQQAOcj3KJ3d7OnMxtmXJxUG4ZpOd+/8w==
X-Received: by 2002:aa7:de13:: with SMTP id h19mr7587769edv.322.1597515257318; 
 Sat, 15 Aug 2020 11:14:17 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371a97000000000000000fcc.dip0.t-ipconnect.de.
 [2003:f1:371a:9700::fcc])
 by smtp.googlemail.com with ESMTPSA id u13sm10353549eje.9.2020.08.15.11.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 11:14:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH for-5.9] iio: adc: meson-saradc: Use the parent device to look
 up the calib data
Date: Sat, 15 Aug 2020 20:13:55 +0200
Message-Id: <20200815181355.407034-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_141420_048727_34B025B9 
X-CRM114-Status: GOOD (  16.50  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 knaack.h@gmx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the older-gen 32-bit SoCs the meson-saradc driver is used to read the
SoC temperature. This requires reading calibration data from the eFuse.

Looking up the calibration data nvmem-cell requires the OF device_node
pointer to be available in the struct device which is passed to
devm_nvmem_cell_get(). This however got lost with commit 8cb631ccbb1952
("iio: Remove superfluous of_node assignments") from indio_dev->dev. As
devm_nvmem_cell_get() is called in the initialization phase the
device_node is not yet available because the NVMEM cell is looked up
before iio_device_register() is called (which would then set the
device_node automatically).
Use the parent device to look up the NVMEM cell instead to fix this
issue.

Fixes: 8cb631ccbb1952 ("iio: Remove superfluous of_node assignments")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 93c2252c0b89..1a9189ba69ae 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -707,7 +707,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	size_t read_len;
 	int ret;
 
-	temperature_calib = devm_nvmem_cell_get(&indio_dev->dev,
+	temperature_calib = devm_nvmem_cell_get(indio_dev->dev.parent,
 						"temperature_calib");
 	if (IS_ERR(temperature_calib)) {
 		ret = PTR_ERR(temperature_calib);
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

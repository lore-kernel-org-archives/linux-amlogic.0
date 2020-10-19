Return-Path: <SRS0=NVL0=D2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAD0C433E7
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 17:28:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE362224D
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 17:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y/OPGNXm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vk4zj/RW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE362224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXwg2unDwKT+c0YObaXX1ckwvzALZSF/7jmNQTr2WfE=; b=Y/OPGNXml1JWubsMBKNiJ78+XE
	LBxqwYv+fdjygxO0OQbT22PKTIL7MqVTNvlMPxP0ZvdUv+TfkqV7y3KZdOi7n8Wgk2sIxWWkzbhEM
	ZPZN+yT1gBdnTZxu/jXsjH70GBD3Gs21zFptvyL0Y3jRMnhQaXEg0oFZ+uoSkp3LAO6uWegmZ07QY
	WEMSyvMAeFTIHNBe5itNn5W8XCEOtLjmH67FoS8Rpo1V+EkqVz6aIADuZ0aWb0mhLmI1VWcLHXPVU
	79Kr+tN/SfXu47dexU0dPqtmFT1smZTXoxM9Z3jG/qdOjcfn4BVlXDWFoMAtENPHh9LQoCaMUMezl
	oG4u2zow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUYxc-0002DD-JH; Mon, 19 Oct 2020 17:28:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUYxV-0002AR-9q
 for linux-amlogic@lists.infradead.org; Mon, 19 Oct 2020 17:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603128512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=HW3zBaCtD1eYq0aK8PlR42sK9/UGx1+e0AwNTosIs2M=;
 b=Vk4zj/RW7JQWN/8dglqh6TQITzU7b2oddxHeXgqeXVCLhU50Bpgp6aGALemzAbIb1PjjRF
 NKYv3Gjw6+5+6P5uXtu3E6knSRG6gGh+btbdnnve1w2NanFd0HQAicOi61im6psPDh/bip
 pXL4To+xs1ltIPjT2+gy3vUIAQUU0d0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-IhQLmRdyMIyZWKvP8gql8Q-1; Mon, 19 Oct 2020 13:28:30 -0400
X-MC-Unique: IhQLmRdyMIyZWKvP8gql8Q-1
Received: by mail-qt1-f199.google.com with SMTP id c4so385558qtx.20
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2020 10:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HW3zBaCtD1eYq0aK8PlR42sK9/UGx1+e0AwNTosIs2M=;
 b=pkRLJdlEDhZL7v0gRM0mg8kcOmbMI66wvnSHRaZj+fLPxRD03Cu2dkoHJeRsTC44g5
 rJSYLeQIEfJE0db4Hr76g8TfBTpNxhLXRf478rvyV1kOZcoy4AxlC/yDfDWQ/tDerfvl
 kkt8X6g9N6xLufpfmK6z14MO9V+tnB13RNv2MyxY855l4FQzx+Bg6CeAERb/Qhhhvaha
 57JbHhrDbaCMAucbLaTzQdOo11PeD8qiQh7RucpFLDRe6fw7jI+91RmKt7nW34xrpqg4
 qHJAqY/XJ5kvsEbHphJZ3N5cdEU8gpIYc2p03MWfoC80+BvvEBIRVSwpmeW+RZWepvkh
 oDAg==
X-Gm-Message-State: AOAM533H5hybjEn6S1+KC4+GNDNHf56UMTDv/FUnYIiMDD1HN8EPsWEM
 s/S2Weoy8zmglwdXTPfl5/aBfkam8pvguFsXu7GLqwrlFQWQ0FyEOdoS9bK4tkC24N8FgI8dy9S
 3UBcGKeVfjvotu/VZ90LCMV2uSU/bQqY=
X-Received: by 2002:ac8:5bc5:: with SMTP id b5mr508610qtb.174.1603128510492;
 Mon, 19 Oct 2020 10:28:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEOFD1teIPDOYCpl3vtGGQdIkQYBiIWt3gTZg1nPEQPWalrkE5Eig1h7A3XXVSaJPOocNZTQ==
X-Received: by 2002:ac8:5bc5:: with SMTP id b5mr508593qtb.174.1603128510296;
 Mon, 19 Oct 2020 10:28:30 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id f189sm275697qkd.20.2020.10.19.10.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 10:28:29 -0700 (PDT)
From: trix@redhat.com
To: jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, khilman@baylibre.com,
 narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, andy.shevchenko@gmail.com,
 krzk@kernel.org, alexandru.ardelean@analog.com, jonathan.albrieux@gmail.com
Subject: [PATCH] iio: remove unneeded break
Date: Mon, 19 Oct 2020 10:28:24 -0700
Message-Id: <20201019172824.32166-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_132833_379511_DFE3936B 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tom Rix <trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/iio/adc/meson_saradc.c       | 2 --
 drivers/iio/imu/bmi160/bmi160_core.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index e03988698755..66dc452d643a 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -593,13 +593,11 @@ static int meson_sar_adc_iio_info_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		return meson_sar_adc_get_sample(indio_dev, chan, NO_AVERAGING,
 						ONE_SAMPLE, val);
-		break;
 
 	case IIO_CHAN_INFO_AVERAGE_RAW:
 		return meson_sar_adc_get_sample(indio_dev, chan,
 						MEAN_AVERAGING, EIGHT_SAMPLES,
 						val);
-		break;
 
 	case IIO_CHAN_INFO_SCALE:
 		if (chan->type == IIO_VOLTAGE) {
diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
index 222ebb26f013..431076dc0d2c 100644
--- a/drivers/iio/imu/bmi160/bmi160_core.c
+++ b/drivers/iio/imu/bmi160/bmi160_core.c
@@ -486,7 +486,6 @@ static int bmi160_write_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_SCALE:
 		return bmi160_set_scale(data,
 					bmi160_to_sensor(chan->type), val2);
-		break;
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		return bmi160_set_odr(data, bmi160_to_sensor(chan->type),
 				      val, val2);
-- 
2.18.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

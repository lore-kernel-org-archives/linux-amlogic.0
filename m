Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145B7C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 12:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D496D22DBF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 12:34:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XWLLFbsT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QX2ousUi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D496D22DBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O+FhK7+60phKC7FlZo2AsOb4cCF/IeGl/FdR4M/9f0E=; b=XWLLFbsTmqdf3i
	1yYuA24T8f3UbvpUk94ysAmR7R21HdTnBvdsT1qisaZQVMwfM1gRxgpI1Qe3a1cQwf34i0OlTQ8aF
	MVdj+K/yiFr0+xwZl3GUZPJYxFyJMhRNBdOCrxdZByKy1Jkhg1n+H4iWQbGq8QBJWH2d2TiA+KNDs
	EFWeI/VKFFfeFxVtpSxlC9EphWV59uFJAH/2r+43r6q+PZq49P6cetbbcr5BxDQhO1EdHjyUIfAyf
	fzgC9JnekXtLh6ILFJv4u4i4ysW9/8Dxqt9XvYDCakiADDopjyO7UEJr78iQ78ldntlDll4ncXRks
	NlDlBFnRA4OLFf2sQafg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i03LS-0007MR-3m; Tue, 20 Aug 2019 12:34:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i03LO-0007LM-Qv
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 12:34:36 +0000
Received: by mail-wr1-x441.google.com with SMTP id z1so12202452wru.13
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4Mb2956O3FRxXwLE7go2npN/BtpK8pSn0FcezT5G7k=;
 b=QX2ousUiVBfSy/6wp/ndiWEdieYpT86MhekZPf558vtyY6ounj3GNb8xDtX9fTyjQ+
 H/6hrMlgDpF8KLQyFos/ukJ65U/LNDR7fJnxuDhLDn1bGgRO8MXmO0eK33ILYpduu0zw
 PH7iRrywrKqO32ZGY/nGOPR5JhMKqUlQTJMaTqoY80etoh8RIpC9EP8D/A7O5miCYyfo
 7+e98l/N4Aza0s8osWdP+wb3iG/Bbfm/OJWyWCMWTn12NuvnNrrKnQaWhTmxYi8IAdak
 obVglZAWVmeNpHBrzeIHVtmM6+SoypHInqmkKexdMhfmznhWEdkeASFDSPBPeMvgtkhJ
 6CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4Mb2956O3FRxXwLE7go2npN/BtpK8pSn0FcezT5G7k=;
 b=J774uKzhJviKfLOhBNCPShX/fJaH9d1BcdJ+ex4lXdzPdjNX2nwBRJ/AW9X3MJ0pnn
 5BBxE4/tyeSTpXnROyFEp86zVWbiqmfWsctDr6C3r9Wt6DQbwaAWn8OA8ou5K1E5qYUy
 MqyexJwBOH+DKky+mW0oIS1F4PzAcCC4lbE6Xin0pzUslAmbSszJEdLyZ7gwi/pi466J
 mZQs1AR/r690vSrSltjuJy7X6gn6J9yTd4X10KECKTLFIAbHuviWIUhyQRDuav1BxpKK
 eUkKBjTcakV0lhcDHc86Y3yZSox4xFHa0nrPsi3XsyzKzCekl3MB7YWuhwPAXHWFZgRa
 BIcw==
X-Gm-Message-State: APjAAAWunC/e7pw//oaT/qFQkLnngPC91fFK6zu5M0j3uZ39NxkTgVv6
 RZhbWJ75L7Ei3H1nYFaxyBbMEQ==
X-Google-Smtp-Source: APXvYqyfMx9psJcHwdQJaV1Gfgogu/f2ULTJSwrbGBvr+1926NVQ0lmFBoo5xeAkyfipxmA98WqE2Q==
X-Received: by 2002:adf:a2cd:: with SMTP id t13mr31996957wra.251.1566304470874; 
 Tue, 20 Aug 2019 05:34:30 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 39sm59456442wrc.45.2019.08.20.05.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 05:34:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: free reset on device removal
Date: Tue, 20 Aug 2019 14:34:13 +0200
Message-Id: <20190820123413.22249-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_053434_875719_AE408CE6 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use the devm variant to get the formatter reset so it is properly freed
on device removal

Fixes: 751bd5db5260 ("ASoC: meson: axg-tdm-formatter: add reset")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 21c735afab35..358c8c0d861c 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -325,7 +325,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	}
 
 	/* Formatter dedicated reset line */
-	formatter->reset = reset_control_get_optional_exclusive(dev, NULL);
+	formatter->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(formatter->reset)) {
 		ret = PTR_ERR(formatter->reset);
 		if (ret != -EPROBE_DEFER)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

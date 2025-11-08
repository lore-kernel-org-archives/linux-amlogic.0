Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0F7CD1292
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYoXMUpe5eHoeztxmshUk1V1y6RhT+SsGWAEt7vHQ+g=; b=BC1HGoI+D3Xujg
	rBXkGwI8mjXbQUWs3bd0H9rfGe8gDiiRmTG4yPh/UrPcFzGlIET8xTO1nZb7MXN+S1IOjeYu3TTt/
	LZUtg4iq1x/qwGaQTI4eEl+5VVT90JjZh4eeQRyAd/4fTkP46EKOyYapzbIhe+DfoPNUQ7+7tgt9v
	nAbrzpR7K6VKo6g+mGlZSDE3wQUnUI2MwembdbK/QIQvgKlXgKJi9P5uQM2XhTw7RH6cqvlv+rFS1
	b+lW779CwZDxFAzncBiSCmkEKdml5y9tsSbNT7oKUXZrJhG29iWzS8s/CHm/id62KkUV85e9phcZb
	ZUYtYmwTKW2+N/f0vJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7k-00000003Yhy-11iK;
	Sat, 08 Nov 2025 23:13:36 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7h-00000003YcT-15mB
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:34 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so3563647a12.1
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 15:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643611; x=1763248411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oO3j4actqzf2xVKKJ0nWDgX3aF/G+cl1rlsWPWa+z8=;
        b=S5NhQRl2wdWS/psHzwrJykZpgQDEFqUWvJ7IKGz2w1S+RoYXVBrccz+a4T3o3b1Q9M
         Zi2Qz+W9Z7RxmtX3eutMpuNsfA3+EJO0PlbVT+tNQg8I2afJ2pOYQVq9Rw3xE0PmxwmL
         Yft8rMZh3zk1ZftgrRdIG3dxgr7EIOLTM5VMnkjqOpJ5PlEdWlgbIA2wt+aoQ4O45bzT
         SZduLLvXOSd4+Apn5X3cFrjTKwoqKuH5VzQn+yogVPWyf3K1LEJLJT5qK7Q4P08mz9om
         oVEDdRGRaVpx3CKjhp/oZ1szkvbcUKb46l26T7YWL4L473mC4G0sfZmcKUcxB4SSQzu7
         CSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643611; x=1763248411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5oO3j4actqzf2xVKKJ0nWDgX3aF/G+cl1rlsWPWa+z8=;
        b=BB+Kv9DtwQoZ+HvOoRmws4GWSG8Q2XSX45YPH+qaSOZekzfleSZJf3gtCNeoWEfWAv
         osVfPAr3JawlyP51HmGtuFaB6LodlQXydXDtjwJOi6vtvO8hgqnssD32p12k7OzImcvQ
         tAHPjvImNW6r3vtQeduYqCDu9um1/kYYRe4k/61G/nv54vHR/+DwMWixUHKHGoFDtbHA
         dcbO5CcBxaIur2kuaTYy2sNk2eT/h+BOuCePgHUSl3RFd1K4hriDoe2CwibtSaPSsXXe
         XyjErSugWt+5xk5R4mSIEcPwwK8qznA6gfMeawJ6fpR7M1vtboua6xDVl/s/+jTI1rGU
         Rp8g==
X-Gm-Message-State: AOJu0YzfBnFdtDUbHabM+C09X1Jx+DPT4Ve2k46KbENb/EBEZpwOC2z8
	Qru+k6qyB2AsyIv+qkJyGqQSYqY54PTLdWhwMxXBJlLZjZQ+Gh3V4Xdg8B/z6g==
X-Gm-Gg: ASbGncugDi1ZW9DJ0zS4JI35mUhc6UdzmlzXCxnCFSmMXO543VTTGackVyneBaeJcFY
	/Q7chQgeRn60L+PFXAeV8xpJzJkLzxcpDP6fUHe4eHAQr3zgcqotTFqwwRuJkBUycT67tMhR+D0
	S32hu3QtOCtBNzBpmf/CmiWjyUObG2yVpADboIOlHZpQUSgXLHoNWuhRsugVyy0MHCP7mBL3B6e
	bwWA/G1ZlhN19lTCbnOR1ia6DlGbdNbNi6XgT3sonqBCcihcIY2/scpn7Klvhcco2yJBiumDJGa
	wmCv2LuHGBKNhn+aKH2s7SOUIUMAmBHMGUate202/DVecxe9IBZOL+07gaNX/TbiZCJKKsa7Jx1
	G3UrqZVxNnmxe9La1ydvMgM8pTfJRnDflrxtQPbnOwGt8E85LF9G2fQrnbkwbCBv1DDXEKX4ksP
	WJVE8MXOHlzJEYaXtRiwHkqp6fALX8oTbtialvzqNtmRVdP1kCs7A4Rg1ybkwIjsyzgq69MP2mW
	F47mvqUqIHSaLip9l3ah6ZH4QRcaGsLPABzcUdpRc0=
X-Google-Smtp-Source: AGHT+IGKjmu35eL8DzEjWyR+sT9K1rO2NK/av8+BPsQU60PgD99LUOCuaaHsb7hf+eDzu3/wZf4PEA==
X-Received: by 2002:a05:6402:44c3:b0:63c:1170:656a with SMTP id 4fb4d7f45d1cf-6415e809ff8mr2471765a12.37.1762643611141;
        Sat, 08 Nov 2025 15:13:31 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:29 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 6/7] mmc: meson-mx-sdio: Fix indentation in meson_mx_mmc_irq_thread()
Date: Sun,  9 Nov 2025 00:12:52 +0100
Message-ID: <20251108231253.1641927-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151333_321283_B671AE9D 
X-CRM114-Status: GOOD (  10.30  )
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

Keep the second line with arguments for dma_unmap_sg() aligned.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 052bcf8f32df..e8b63dc45dd8 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -436,8 +436,7 @@ static irqreturn_t meson_mx_mmc_irq_thread(int irq, void *irq_data)
 
 	if (cmd->data) {
 		dma_unmap_sg(mmc_dev(host->mmc), cmd->data->sg,
-				cmd->data->sg_len,
-				mmc_get_dma_dir(cmd->data));
+			     cmd->data->sg_len, mmc_get_dma_dir(cmd->data));
 
 		cmd->data->bytes_xfered = cmd->data->blksz * cmd->data->blocks;
 	}
-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

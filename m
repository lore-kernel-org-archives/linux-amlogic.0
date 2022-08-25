Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA9C04AA5
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74Qx+15t2WENMGkc4EUPpWgYJ8fRmL7StryEhQpncqo=; b=lFUd9KLOays5vB
	yuq/bUxtRo8lmRbd44fcNs5Fcnbwrejn77eoc78FJrX8U+bFOwJ2kb/4Bd9tS/qYB8VvleE5WOD8c
	UquI0IPE0+HXe1K0LZGitqCoerHPhqx+0/NoRDCGJg1Ui4y5MN86g2HmU+zUod2ywoSGZhWSbpxBK
	yvF+gxnlp3eRm17ijf+OFJxo+IA+C0onIo9D8dNufsZyN9GcQGkfOIs33rI0uPXDRNCdDFxjg9F0z
	q8Xl2VZOj6kc9+rKYXQUxtBJLubE8R+P515FLiDN3R9kvzeLho8XaSDMcaFfTcwq66UOOyz1U771K
	9+qAtLNc/KFhrrktjIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7ET-00906m-EK; Thu, 25 Aug 2022 07:24:53 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7E5-008yfQ-O6
	for linux-amlogic@lists.infradead.org; Thu, 25 Aug 2022 07:24:31 +0000
Received: by mail-ej1-x633.google.com with SMTP id w19so37835335ejc.7
        for <linux-amlogic@lists.infradead.org>; Thu, 25 Aug 2022 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=iP30pHrSfvf//uv6vYc2HV2OsHCadoMIEZDRU1K2e5k=;
        b=FjKuASlS49j208n5Kl+QlCP37BPbCoGM6O6BdIcVjegb3xtzbRMAldDlBrl197HM16
         Fho9RC/2JtNXq6ufUP5Iurkcey669vkstHxtp9gShG4Ta62xLiRwfsdMr/866Q8TaMim
         JeOG2VlimSO56CRUORP2VA/niecVlozajZudJTeY+e6+xZFUEQWulC3tAlK/OASog++P
         NjJ3hGUALqEODwHpDd+LRMDdBThWApmP6EdxybcUKJKh/FNzrqZw2AnGhAIKCcI8jfhj
         GktnUz0sKuHyPXM3MW3uIoFB2RINqvOvXHROGspI+r2vlvIgCg4qjmCbYOiWNIkwHOQl
         cijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=iP30pHrSfvf//uv6vYc2HV2OsHCadoMIEZDRU1K2e5k=;
        b=xFGZpVDNdSr6AMq7xb6mGdjm8HtTeqg2jCm2AhxTquxe3BA4lLG6nbFHr9QaUGelfL
         2jGSkDRMa53UyMU+awhPLQrZW8nt18sUZh3fDQkOk0AUqnCZL8ydkYpsZ06uNXKoXCnZ
         whMslGTT92anwUn2kH4wVPUh+KUwA4lnBavJahYEvG+kJgTAv4Mu+Yn8TxYnwolWQN7A
         RnoC6mDZsSgOrszvk1iWn/JuajGJGg/q6WvIRL0rAjEmMrkK7AakvMRkrdJiH2FbtIot
         xYoxLjTUFXqGj6KwccpGVFaW7BZoQuFqgwQRGT5ypGAtb9PhVhLsN8uzkqVOOysa82lB
         qhbQ==
X-Gm-Message-State: ACgBeo1MFFaqMM7MOKggz7bDBKKHzeeTgqLHj6nK8OmDzT24xofgSxr8
	4XYL3UqEzaazLbP352rPFOjL2Q==
X-Google-Smtp-Source: AA6agR5uR7pT04jGGk2tkZTpZwwm5LskjqagqLGYMahxhnEFlMFMyjKz901JuP7vFx67ULz8lckojw==
X-Received: by 2002:a17:906:846f:b0:73d:710b:357e with SMTP id hx15-20020a170906846f00b0073d710b357emr1603084ejc.103.1661412265367;
        Thu, 25 Aug 2022 00:24:25 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:142d:a900:eab:b5b1:a064:1d0d])
        by smtp.gmail.com with ESMTPSA id ky12-20020a170907778c00b0073ce4abf093sm2032281ejc.214.2022.08.25.00.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:24:24 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: herbert@gondor.apana.org.au,
	linux-crypto@vger.kernel.org
Cc: Corentin Labbe <clabbe@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] crypto: amlogic: Fix dma_map_sg error check
Date: Thu, 25 Aug 2022 09:24:19 +0200
Message-Id: <20220825072421.29020-5-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825072421.29020-1-jinpu.wang@ionos.com>
References: <20220825072421.29020-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_002429_817242_B48A5672 
X-CRM114-Status: GOOD (  12.37  )
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

dma_map_sg return 0 on error.

Cc: Corentin Labbe <clabbe@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index e79514fce731..af017a087ebf 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -177,7 +177,7 @@ static int meson_cipher(struct skcipher_request *areq)
 	if (areq->src == areq->dst) {
 		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
 				    DMA_BIDIRECTIONAL);
-		if (nr_sgs < 0) {
+		if (!nr_sgs) {
 			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
 			err = -EINVAL;
 			goto theend;
@@ -186,14 +186,14 @@ static int meson_cipher(struct skcipher_request *areq)
 	} else {
 		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
 				    DMA_TO_DEVICE);
-		if (nr_sgs < 0 || nr_sgs > MAXDESC - 3) {
+		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
 			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
 			err = -EINVAL;
 			goto theend;
 		}
 		nr_sgd = dma_map_sg(mc->dev, areq->dst, sg_nents(areq->dst),
 				    DMA_FROM_DEVICE);
-		if (nr_sgd < 0 || nr_sgd > MAXDESC - 3) {
+		if (!nr_sgd || nr_sgd > MAXDESC - 3) {
 			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgd);
 			err = -EINVAL;
 			goto theend;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

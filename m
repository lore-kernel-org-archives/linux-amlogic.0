Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97D6C25B0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 06:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TjTe9ZmoLQWbAx10asiez9e+RgQr+2MFyq56YDk944=; b=O+2Cvp8ZV9cNTo
	H3r+504tlXkJ2sKt1ZqWzXzuUU62HVh0S5UT0oO9nvf+8JYPS62ILli1AH1rUEkjWq6hADJ6uw7E1
	W7POicLSSxRkykRmr59ZrjyofQuCcZmAqT31Fees9KbePUhd3+IAeQ3YywtN3JkV/PoFLgNhKFScM
	RdZAPxVw1Ad9TaoLeU2UUx9wJfBbM1Ol3wH7EPyz/H6mbyUe70JwQzV87UnsRZVmupdGjwKQdBc3/
	CHmzjE8cnows69i+TWRXvgJnCAVt8AGSWNpWgtNU79+k8BovELpMYYZAa7N27/zW96G1bfvJVZgxO
	IUojwmm8R6USzSU2ZkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvBf-002Acv-Ms; Fri, 19 Aug 2022 06:08:55 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvB7-0029cv-TA
	for linux-amlogic@lists.infradead.org; Fri, 19 Aug 2022 06:08:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id qn6so6952198ejc.11
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Aug 2022 23:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=F5ABPES53yBnNM8KMYaOoJGq6EgoilQgsIQzRxOn8jI=;
        b=YF9RDOWfoLh1rKjWTYgYRo+wyiZASSeVrPh9Z70zeRcDdGmQB3lQT7MPFxJXHqlu+M
         osfBgwSm98SFRcW8wlbcC7vK6DmPb6aKRn5z/Ba0K+qEsnyMxYg1jcgWV/2UyxnAwnEQ
         MfGHH3SoCYX9kM1xEFBRZz8Agb6CqTD6RyOE2yaoiVP4theIZp9an+m8AbQDehTGukSB
         Mw1rEXirxBiuAaZdwCSx1VXbv8ye39ic9KrRi5ONSIGqKYv+5bYHnFf6XmZDwRcd9+p5
         eLj5546HBAkV+eB0IWBmdPR3FZ/FoBJM9JLkOtFcVcq4yhGfO9gnyqJDB5QpSv1uibdN
         CnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=F5ABPES53yBnNM8KMYaOoJGq6EgoilQgsIQzRxOn8jI=;
        b=Kby4D7pwjn9UlCkhmf0Badjdj/ghY5O+R157drb4oj6ND4OTj+BCZ6bgvTjRTrMWzj
         YFL2hyfUOcAsXaZlO8xzaR8dkSyfgHCPN5DgO84nvzKbn4AerRpzhkRM7BHXZyOQdIsh
         /Ynv6TpweES08dE2st56TVcsLe6gooeJBssGucHkYE6CaOYGqbcP94s/dyair1h/Qdsm
         25k95L8Wa3yyj7+LhgkhapYVefgTljhpD0WGsPgkhUB/UEwb7FG5L/MWcs558ZVsn42/
         JXCwjcX+EiAvzTFATRxvJpQ6H345Raw/Dh+K8OVTM/ar4ykK7W31W2x5PES633BKcuuy
         hIBA==
X-Gm-Message-State: ACgBeo1fzt+nJ8AJ+7I7egaSRBmTvycXvMAi/4Es/TFurBG+kb8xhV/c
	gpPyu+IzK+pQIgsK8VJQeSW8Lw==
X-Google-Smtp-Source: AA6agR7vpe7XwFhB8bWIG6ZHamJs/kMyizsVnVvMQeylgjrGCsHiyms0BKMF09snW3nldFzq48Vd7A==
X-Received: by 2002:a17:906:8a55:b0:73b:d8ea:6c2b with SMTP id gx21-20020a1709068a5500b0073bd8ea6c2bmr3343732ejc.114.1660889299632;
        Thu, 18 Aug 2022 23:08:19 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:143b:fd00:5207:8c7f:747a:b80d])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709063a8e00b0073a644ef803sm1809660ejd.101.2022.08.18.23.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 23:08:19 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: linux-kernel@vger.kernel.org
Cc: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v1 10/19] crypto: amlogic: Fix dma_map_sg error check
Date: Fri, 19 Aug 2022 08:07:52 +0200
Message-Id: <20220819060801.10443-11-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819060801.10443-1-jinpu.wang@ionos.com>
References: <20220819060801.10443-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_230822_002003_8B5072BB 
X-CRM114-Status: GOOD (  11.95  )
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

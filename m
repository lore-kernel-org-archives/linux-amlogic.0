Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89069606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2026 02:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a6sBpStl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=SNG9njAR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wliEYXsHgJMhQCOGCic7fZMJnmTlTBEPqI8fzlEX8dM=; b=a6sBpStl+1HP2iiKaAHBvT6EQD
	qyi9YLP4nElQMCM/ygh1EfLhCFOSyMt+i3tyN+V/wubRoEMtOdjaJFeLPs/zK27is3sY8qW9lSGXe
	yfxeeL/BitQ7nslw8I6l67Gvo91HWHTDfDp/9L3AdMPvdZkYzeUD2/qAELnwo5oL9mSkTcsZHDI/v
	jI8AZ+rebJYWqM3s8l4KTaiKifJR2RK+pRibTigDUwX/xJZX83wLjqArxmuAsPmYlS5y1huaVufL8
	dHziWlc+ehSEUklFc5jf/BuPf8mjtefePCGpAoOkjMproQ6ZEDP4VRXKoM/ObQ8bBjENAMTYjeI7g
	H5zVpKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrnu-0000000Ag8e-1qAB;
	Thu, 19 Nov 2026 02:23:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrnt-0000000Ag8T-3ECk
	for linux-amlogic@lists.infradead.org;
	Thu, 19 Nov 2026 02:23:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBD6361B4A;
	Thu, 19 Nov 2026 02:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BF51F000C7;
	Thu, 19 Nov 2026 02:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795054992;
	bh=muBtTw03L5Q+ktViRHTg43LW47QauHPdA3EAg4zKHgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SNG9njARziaXtEHSElrg/Wp6NNx7U0+Cxmy4BtndUZ8ljw0EkiYfFObiUaCh9BrOv
	 jNinBl/8NdGv+xyMypU9KLL7vWeFrXWG0moumvazG6swe8sD/tYsLJMKQUmMaEXvyt
	 8NpqL5IcDixIujGsVDYp/uCF16B+8OgupSSRpKe8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jack Wang <jinpu.wang@ionos.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 1473/2214] crypto: amlogic - Fix dma_map_sg error check
Date: Wed, 18 Nov 2026 15:52:29 +0100
Message-ID: <20261118150110.101789092@linuxfoundation.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118150009.797899913@linuxfoundation.org>
References: <20261118150009.797899913@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jack Wang <jinpu.wang@ionos.com>

[ Upstream commit 45fa321e7de604146603e24ee5bf3c0b766efe46 ]

dma_map_sg return 0 on error.

Cc: Corentin Labbe <clabbe@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Stable-dep-of: 6c2373dd818b ("crypto: amlogic - Fix DMA memory leak in cipher error path")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index e79514fce731f..af017a087ebf0 100644
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
2.53.0




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

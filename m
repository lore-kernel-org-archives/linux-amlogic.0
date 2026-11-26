Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151B606A31E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c3IoOeMq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=A1bZ6+Nq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziNyLQoc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z192NKKFj+BmY1RXL3aFSpvUHI5JQLG8FjXoqr8io+M=; b=c3IoOeMqqtjFMVzw8URWaciycg
	oP0bMKWpn1I0BnoZbZp0lmHLHRIUIYK/bf2e9HK3X60ssoZFntxClPZjYRUlXKyXaDZEGyoQb21dd
	JDJZgbGcvpUF8TlDPYQOFNN/Ff8+DlUnDYpW8ayeDG/VGAoiua7so/2BSUT0HDGrI68FyFYlyHbwE
	6qOAOrOQfenhIv5cX+G93S4j6lRJbVSjoHUONA2EPHFrW/tjNufmMfMwsMJh01fRmNna/9orzpBe8
	nJyMc9Z+F7n+fTXF49GnJN1Q6J4+cC1oHsC6PLmjTh9HAAh8XIiCD51auRVWZLlVlszShGqwtc8uQ
	7fvNkyHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEI-0000000EKsY-3QyX;
	Thu, 26 Nov 2026 19:34:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDs-0000000EJz0-2QUi
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Nov 2026 19:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hbddC97o04ZKg1StPMOMc8GcEnBHPu2bJqDhfBcc/DY=; b=A1bZ6+NqcnEnCUaKbbNwvJ5AW5
	Lz3BEMeGdVUHcB2MdpZBYliDUYNKKbSdISlNVx+pK5Rv+VO3Xcjh83y+MiyVRqK1duHZyETVn12yu
	u9hIIIPlGpqRE0K+kIB7OaGecaPTdb1de9NxgEc90i5h6ZkHz8HElVKN1ldziglkmRch82MEhK7Cl
	d2BeBzPfcNrH72b+fo0vvqdaUeW77woDwzT4kLRrJZSvwC7PmQJ1M9drCUyWHx02qHNk5QvMR8fA7
	Cq5cS9c5MOd6oeSAWobQ8U6T6EJGwDUHAZA0EXQMSPfroqsL2o1Ra+7kfpHLSZEBabSczP7G25EZK
	E9/SqjlA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDp-00000006zzO-3Gh0
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so50542895e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721612; x=1796326412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbddC97o04ZKg1StPMOMc8GcEnBHPu2bJqDhfBcc/DY=;
        b=ziNyLQoc/yttYwhcp421scxzon0cpp/im0qjpeGOhCf7uzO+CAF9jDUCXPAZfGLeAw
         YYrc9+GMYCz9NnWv2P424czPESJl/0ANCBO2K1Y7pr3paxjslP+tJRKscuqi44DF6YB9
         UUoQSE+WpIYEFtuOOIziSOs4LaBKaQIBfTMZSQy43gpFrpmQ4cojkTRBbiKQ4ZRuBa43
         qK4LWg5MgjHBFLJVDmQRqZsBdPLyHUCsskzCPV90xKruqjAnHTXbWDrfPfJ2+GD1zi1Q
         do91y1FCVbia4WlqSa4SvJwF6SwhoJravhlDJVS7sk+SgSVnRHUB4bR7uE4p6noSYEs+
         2wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721612; x=1796326412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbddC97o04ZKg1StPMOMc8GcEnBHPu2bJqDhfBcc/DY=;
        b=nH2iqmsI49ernJ3QJ6VnE5mrTB9/c+/oezsUrtKcvviqBjbAKyrm3ege+AYYPbaG51
         RBaSFIucGcJYON/RPJtPa5ZSnBhssu4QqKJaWXSHkm+S7paUR6317sYrrKJOXjCGDqJg
         wmMxXzddtUqtFEdTIa6f/4ZnzMnethS+v28HFZn3UmDCvH7pEByUKLmtDFX46gn28i46
         WY7b43fNF+qpNuhUoI1dRbxWKWfIC26AND0JBQvO8FF1Kn2NBMMxrf/Y2/HRzYCT2Myd
         Eui+AhKqT7KyBDfBRf1ofGfad5kgrYBGj3ag7ydGWRfG79FbLuSjcWHlxIN9E8jwTf3Y
         moKA==
X-Forwarded-Encrypted: i=1; AL+hErHQbZGl9u0xzNm0HEpriZu/7D+cL0G8NSwPhsx0nrkd237U/1bs5PtLrYKLLCT4V1Im/PbRmtRV5P46/wMm@lists.infradead.org
X-Gm-Message-State: APuU4Z9pmKdQQoSB1FHEuvXjqHPb8eKv8q4PjGQzXbW345peNcSy5TUB
	3z9vTpPgFsXXg05ZdW+3Tx+wZDeyYRcLdXu1m3pnkVi+uzmOo0QZ/ZCZ
X-Gm-Gg: AZFdTZfou76ZIkgCOBbSGytgyLhdnnOg4n/s8QWQDS+OfiuQ1AnEcBMOUtT14M3Uye6
	isA/DM8xL0oT7LAjS7gclXEVGuCrdAohFNNR2dyM7r0Dlsg/z4Mr/cEEyJLc+o2lq23JTqqwNvD
	gHUDA7gaRvhxz/KeEEhLwvDa0MtuPiGQJJYODAJoKlqFkex3dMuer96h3qAHccURyMsKqasIqW/
	OH3lLlGA6laGpfGCo1ZxyoU2fa+sAzNXY/m1Gj9ZCZZMcSaHzACMEBXD+d/OJWlnCPbn2uRNIp1
	/8/1UKYqxReEyL2lRRfWhFRWqrkKOBRBlj/YVtxwkRza56Bn8IaWOCyHsWjx+BjOHYBq+57KMc+
	GJwX2uAZjU3lC2L5sYWxU9EmAoweHODtC/WVfXRmzmqzwWQsFlQxj8iRXHyi87Ro8lCBr2qD1Gv
	ftBgjfscobVOvD1G1IfMhVpuADWWLxuEqDBYGEUIGuvNF3gQun3yEDSKQ1EpcLhM4PxIhGTD+pN
	Y7h6w7N/1Qr1L7SFsL2NZAGM1e9ZwL9DY2I08Bn5mmil68Rl0T4KfFBPjnCTzjjvQssKqGJwDB1
	FJaEUWWSvgpsWzoF+utOIofnShrw2R1hDafgZQ1F68YfpA==
X-Received: by 2002:a05:600c:a08e:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4bb887e0682mr449158305e9.4.1795721611530;
        Thu, 26 Nov 2026 11:33:31 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:31 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v13 19/25] crypto: amlogic: hasher: add one-shot digest path
Date: Thu, 26 Nov 2026 20:32:35 +0100
Message-ID: <20261126193241.1471372-20-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_193333_647964_6D091AAD 
X-CRM114-Status: GOOD (  19.36  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement the ahash ->digest callback so one-shot SHA requests are sent
as a single engine transfer instead of the init/update/final sequence,
and skip the spurious trailing block for digest requests.

Also unregister the hasher on device removal and lower the "hasher not
supported" message to dev_dbg.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 +
 drivers/crypto/amlogic/amlogic-gxl-hasher.c | 29 +++++++++++++++++++--
 drivers/crypto/amlogic/amlogic-gxl.h        |  5 +++-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 3a6bac10bb04..e79175368d8c 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -269,6 +269,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(mc->dbgfs_dir);
 #endif
 
+	meson_hasher_unregister(mc);
 	meson_cipher_unregister(mc);
 
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-hasher.c b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
index c83739ec3456..978cdcd8a4f9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-hasher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
@@ -51,6 +51,25 @@ static int meson_sha_final(struct ahash_request *req)
 	return crypto_transfer_hash_request_to_engine(engine, req);
 }
 
+static int meson_sha_digest(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct crypto_engine *engine;
+
+	memset(rctx, 0, sizeof(struct meson_hasher_req_ctx));
+
+	rctx->flow = meson_get_engine_number(tctx->mc);
+	rctx->begin_req = true;
+	rctx->final_req = true;
+	rctx->digest_req = true;
+
+	engine = tctx->mc->chanlist[rctx->flow].engine;
+
+	return crypto_transfer_hash_request_to_engine(engine, req);
+}
+
 static int meson_hasher_req_map(struct ahash_request *req)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
@@ -251,7 +270,7 @@ static int meson_hasher_do_one_request(struct crypto_engine *engine, void *areq)
 	struct hasher_ctx ctx = {
 		.tloffset = 0,
 		.src_offset = 0,
-		.nbytes = rctx->final_req ? 0 : req->nbytes,
+		.nbytes = (rctx->final_req && !rctx->digest_req) ? 0 : req->nbytes,
 		.src_sg = req->src,
 		.areq = areq,
 	};
@@ -310,6 +329,9 @@ static int meson_hasher_do_one_request(struct crypto_engine *engine, void *areq)
 		if (!ctx.todo && ctx.nbytes)
 			continue;
 
+		if (!ctx.todo && rctx->final_req && rctx->partial_size)
+			continue;
+
 		if (!ctx.todo && !rctx->final_req && !ctx.tloffset)
 			continue;
 
@@ -393,6 +415,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -421,6 +444,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -449,6 +473,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -463,7 +488,7 @@ int meson_hasher_register(struct meson_dev *mc)
 	int i;
 
 	if (!mc->pdata->hasher_supported) {
-		pr_info("amlogic-gxl-hasher: hasher not supported at current platform");
+		dev_dbg(mc->dev, "hasher is not supported on this platform\n");
 		return 0;
 	}
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index a44290fcf3a0..3f1ce6c05558 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -161,7 +161,9 @@ struct meson_cipher_tfm_ctx {
  * @partial_size:	size of the partial buffer
  * @partial_addr:	physical address of partial buffer
  * @partial_mapped:	indicates is partial buffer currently mapped or not
- * @flags:		request flags (for example, is this final req or not)
+ * @begin_req:		indicates this is the first request
+ * @final_req:		indicates this is the final request
+ * @digest_req:		indicates a one-shot digest request
  * @flow:		the flow to use for this request
  */
 struct meson_hasher_req_ctx {
@@ -173,6 +175,7 @@ struct meson_hasher_req_ctx {
 
 	bool begin_req;
 	bool final_req;
+	bool digest_req;
 	int flow;
 };
 
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

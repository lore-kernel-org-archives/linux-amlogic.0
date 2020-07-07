Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADBBC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188C7206CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b4oGWSKZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yn8DbHgB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188C7206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oF3QUON0zxZplB3RB11FJztXuNX7KSfhFGLvY7YepLE=; b=b4oGWSKZ3XrTx3rmKjxZYCydx
	oXaCqUTbit/L14aceRrP9jFJGZhWA1pTQNTLu3ZpgOkxebWf5BOPP8BfwVO6SHs/dM1zBQREoYGUc
	GKnUXY4I5dQCErRMMKge36uUv0hfp5oX19UXKmGQjcfEhWdrJrkSh9JapmvuDlct9wPltmTFG0ONz
	7XVJnj8+Qu1ft+aJnIPwYkupmhCG+B4vlcFELWahEOKeewoBC4K0HFaPd4ejBs03VqXK/Pp6LFOOR
	E60NZBPy6ZPumc0aFYIDTq5c+Ds+4OntzlSL8CcsIyQme6GtfdARkn5QYIDNYuNof9KF6qDFU/egV
	8r5CTpIvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jshBJ-0002fJ-3z; Tue, 07 Jul 2020 06:34:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jshAn-0002ON-EH; Tue, 07 Jul 2020 06:33:47 +0000
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr
 [109.242.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF904206DF;
 Tue,  7 Jul 2020 06:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594103624;
 bh=/hSweZjB6DuQzljyPwbZtGwfSoV4H4jE/MTAEhkVsHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yn8DbHgBm15HCFv/Sbc882J6rbUrtnX9WkL2K17XMntzNaPeLGw1b5/sg3cvI83q5
 kacEAPuwVmO528qp7LOXl5jFn2l/Q7sScKPipGqI1My5Hu1CwZg3bkglGt4UbT41b2
 SuVmz97de7RU69WTymTRg5dcZH9Iw9yqjCwzM4Eo=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v4 09/13] crypto: mxs-dcp - permit asynchronous skcipher as
 fallback
Date: Tue,  7 Jul 2020 09:31:59 +0300
Message-Id: <20200707063203.5018-10-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_023345_652261_A16FB63E 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: Eric Biggers <ebiggers@google.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>, Jamie Iles <jamie@jamieiles.com>,
 Fabio Estevam <festevam@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, John Allen <john.allen@amd.com>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RXZlbiB0aG91Z2ggdGhlIG14cy1kY3AgZHJpdmVyIGltcGxlbWVudHMgYXN5bmNocm9ub3VzIHZl
cnNpb25zIG9mCmVjYihhZXMpIGFuZCBjYmMoYWVzKSwgdGhlIGZhbGxiYWNrcyBpdCBhbGxvY2F0
ZXMgYXJlIHJlcXVpcmVkIHRvIGJlCnN5bmNocm9ub3VzLiBHaXZlbiB0aGF0IFNJTUQgYmFzZWQg
c29mdHdhcmUgaW1wbGVtZW50YXRpb25zIGFyZSB1c3VhbGx5CmFzeW5jaHJvbm91cyBhcyB3ZWxs
LCBldmVuIHRob3VnaCB0aGV5IHJhcmVseSBjb21wbGV0ZSBhc3luY2hyb25vdXNseQoodGhpcyB0
eXBpY2FsbHkgb25seSBoYXBwZW5zIGluIGNhc2VzIHdoZXJlIHRoZSByZXF1ZXN0IHdhcyBtYWRl
IGZyb20Kc29mdGlycSBjb250ZXh0LCB3aGlsZSBTSU1EIHdhcyBhbHJlYWR5IGluIHVzZSBpbiB0
aGUgdGFzayBjb250ZXh0IHRoYXQKaXQgaW50ZXJydXB0ZWQpLCB0aGVzZSBpbXBsZW1lbnRhdGlv
bnMgYXJlIGRpc3JlZ2FyZGVkLCBhbmQgZWl0aGVyIHRoZQpnZW5lcmljIEMgdmVyc2lvbiBvciBh
bm90aGVyIHRhYmxlIGJhc2VkIHZlcnNpb24gaW1wbGVtZW50ZWQgaW4gYXNzZW1ibGVyCmlzIHNl
bGVjdGVkIGluc3RlYWQuCgpTaW5jZSBmYWxsaW5nIGJhY2sgdG8gc3luY2hyb25vdXMgQUVTIGlz
IG5vdCBvbmx5IGEgcGVyZm9ybWFuY2UgaXNzdWUsIGJ1dApwb3RlbnRpYWxseSBhIHNlY3VyaXR5
IGlzc3VlIGFzIHdlbGwgKGR1ZSB0byB0aGUgZmFjdCB0aGF0IHRhYmxlIGJhc2VkIEFFUwppcyBu
b3QgdGltZSBpbnZhcmlhbnQpLCBsZXQncyBmaXggdGhpcywgYnkgYWxsb2NhdGluZyBhbiBvcmRp
bmFyeSBza2NpcGhlcgphcyB0aGUgZmFsbGJhY2ssIGFuZCBpbnZva2UgaXQgd2l0aCB0aGUgY29t
cGxldGlvbiByb3V0aW5lIHRoYXQgd2FzIGdpdmVuCnRvIHRoZSBvdXRlciByZXF1ZXN0LgoKU2ln
bmVkLW9mZi1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6
IEhvcmlhIEdlYW50xIMgPGhvcmlhLmdlYW50YUBueHAuY29tPgotLS0KIGRyaXZlcnMvY3J5cHRv
L214cy1kY3AuYyB8IDMzICsrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlw
dG8vbXhzLWRjcC5jIGIvZHJpdmVycy9jcnlwdG8vbXhzLWRjcC5jCmluZGV4IGQ4NDUzMDI5MzAz
Ni4uOTA5YTdlYjc0OGUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NyeXB0by9teHMtZGNwLmMKKysr
IGIvZHJpdmVycy9jcnlwdG8vbXhzLWRjcC5jCkBAIC05Nyw3ICs5Nyw3IEBAIHN0cnVjdCBkY3Bf
YXN5bmNfY3R4IHsKIAl1bnNpZ25lZCBpbnQJCQlob3Q6MTsKIAogCS8qIENyeXB0by1zcGVjaWZp
YyBjb250ZXh0ICovCi0Jc3RydWN0IGNyeXB0b19zeW5jX3NrY2lwaGVyCSpmYWxsYmFjazsKKwlz
dHJ1Y3QgY3J5cHRvX3NrY2lwaGVyCQkqZmFsbGJhY2s7CiAJdW5zaWduZWQgaW50CQkJa2V5X2xl
bjsKIAl1aW50OF90CQkJCWtleVtBRVNfS0VZU0laRV8xMjhdOwogfTsKQEAgLTEwNSw2ICsxMDUs
NyBAQCBzdHJ1Y3QgZGNwX2FzeW5jX2N0eCB7CiBzdHJ1Y3QgZGNwX2Flc19yZXFfY3R4IHsKIAl1
bnNpZ25lZCBpbnQJZW5jOjE7CiAJdW5zaWduZWQgaW50CWVjYjoxOworCXN0cnVjdCBza2NpcGhl
cl9yZXF1ZXN0IGZhbGxiYWNrX3JlcTsJLy8ga2VlcCBhdCB0aGUgZW5kCiB9OwogCiBzdHJ1Y3Qg
ZGNwX3NoYV9yZXFfY3R4IHsKQEAgLTQyNiwyMSArNDI3LDIwIEBAIHN0YXRpYyBpbnQgZGNwX2No
YW5fdGhyZWFkX2Flcyh2b2lkICpkYXRhKQogc3RhdGljIGludCBteHNfZGNwX2Jsb2NrX2ZhbGxi
YWNrKHN0cnVjdCBza2NpcGhlcl9yZXF1ZXN0ICpyZXEsIGludCBlbmMpCiB7CiAJc3RydWN0IGNy
eXB0b19za2NpcGhlciAqdGZtID0gY3J5cHRvX3NrY2lwaGVyX3JlcXRmbShyZXEpOworCXN0cnVj
dCBkY3BfYWVzX3JlcV9jdHggKnJjdHggPSBza2NpcGhlcl9yZXF1ZXN0X2N0eChyZXEpOwogCXN0
cnVjdCBkY3BfYXN5bmNfY3R4ICpjdHggPSBjcnlwdG9fc2tjaXBoZXJfY3R4KHRmbSk7Ci0JU1lO
Q19TS0NJUEhFUl9SRVFVRVNUX09OX1NUQUNLKHN1YnJlcSwgY3R4LT5mYWxsYmFjayk7CiAJaW50
IHJldDsKIAotCXNrY2lwaGVyX3JlcXVlc3Rfc2V0X3N5bmNfdGZtKHN1YnJlcSwgY3R4LT5mYWxs
YmFjayk7Ci0Jc2tjaXBoZXJfcmVxdWVzdF9zZXRfY2FsbGJhY2soc3VicmVxLCByZXEtPmJhc2Uu
ZmxhZ3MsIE5VTEwsIE5VTEwpOwotCXNrY2lwaGVyX3JlcXVlc3Rfc2V0X2NyeXB0KHN1YnJlcSwg
cmVxLT5zcmMsIHJlcS0+ZHN0LAorCXNrY2lwaGVyX3JlcXVlc3Rfc2V0X3RmbSgmcmN0eC0+ZmFs
bGJhY2tfcmVxLCBjdHgtPmZhbGxiYWNrKTsKKwlza2NpcGhlcl9yZXF1ZXN0X3NldF9jYWxsYmFj
aygmcmN0eC0+ZmFsbGJhY2tfcmVxLCByZXEtPmJhc2UuZmxhZ3MsCisJCQkJICAgICAgcmVxLT5i
YXNlLmNvbXBsZXRlLCByZXEtPmJhc2UuZGF0YSk7CisJc2tjaXBoZXJfcmVxdWVzdF9zZXRfY3J5
cHQoJnJjdHgtPmZhbGxiYWNrX3JlcSwgcmVxLT5zcmMsIHJlcS0+ZHN0LAogCQkJCSAgIHJlcS0+
Y3J5cHRsZW4sIHJlcS0+aXYpOwogCiAJaWYgKGVuYykKLQkJcmV0ID0gY3J5cHRvX3NrY2lwaGVy
X2VuY3J5cHQoc3VicmVxKTsKKwkJcmV0ID0gY3J5cHRvX3NrY2lwaGVyX2VuY3J5cHQoJnJjdHgt
PmZhbGxiYWNrX3JlcSk7CiAJZWxzZQotCQlyZXQgPSBjcnlwdG9fc2tjaXBoZXJfZGVjcnlwdChz
dWJyZXEpOwotCi0Jc2tjaXBoZXJfcmVxdWVzdF96ZXJvKHN1YnJlcSk7CisJCXJldCA9IGNyeXB0
b19za2NpcGhlcl9kZWNyeXB0KCZyY3R4LT5mYWxsYmFja19yZXEpOwogCiAJcmV0dXJuIHJldDsK
IH0KQEAgLTUxMCwyNCArNTEwLDI1IEBAIHN0YXRpYyBpbnQgbXhzX2RjcF9hZXNfc2V0a2V5KHN0
cnVjdCBjcnlwdG9fc2tjaXBoZXIgKnRmbSwgY29uc3QgdTggKmtleSwKIAkgKiBidXQgaXMgc3Vw
cG9ydGVkIGJ5IGluLWtlcm5lbCBzb2Z0d2FyZSBpbXBsZW1lbnRhdGlvbiwgd2UgdXNlCiAJICog
c29mdHdhcmUgZmFsbGJhY2suCiAJICovCi0JY3J5cHRvX3N5bmNfc2tjaXBoZXJfY2xlYXJfZmxh
Z3MoYWN0eC0+ZmFsbGJhY2ssIENSWVBUT19URk1fUkVRX01BU0spOwotCWNyeXB0b19zeW5jX3Nr
Y2lwaGVyX3NldF9mbGFncyhhY3R4LT5mYWxsYmFjaywKKwljcnlwdG9fc2tjaXBoZXJfY2xlYXJf
ZmxhZ3MoYWN0eC0+ZmFsbGJhY2ssIENSWVBUT19URk1fUkVRX01BU0spOworCWNyeXB0b19za2Np
cGhlcl9zZXRfZmxhZ3MoYWN0eC0+ZmFsbGJhY2ssCiAJCQkJICB0Zm0tPmJhc2UuY3J0X2ZsYWdz
ICYgQ1JZUFRPX1RGTV9SRVFfTUFTSyk7Ci0JcmV0dXJuIGNyeXB0b19zeW5jX3NrY2lwaGVyX3Nl
dGtleShhY3R4LT5mYWxsYmFjaywga2V5LCBsZW4pOworCXJldHVybiBjcnlwdG9fc2tjaXBoZXJf
c2V0a2V5KGFjdHgtPmZhbGxiYWNrLCBrZXksIGxlbik7CiB9CiAKIHN0YXRpYyBpbnQgbXhzX2Rj
cF9hZXNfZmFsbGJhY2tfaW5pdF90Zm0oc3RydWN0IGNyeXB0b19za2NpcGhlciAqdGZtKQogewog
CWNvbnN0IGNoYXIgKm5hbWUgPSBjcnlwdG9fdGZtX2FsZ19uYW1lKGNyeXB0b19za2NpcGhlcl90
Zm0odGZtKSk7CiAJc3RydWN0IGRjcF9hc3luY19jdHggKmFjdHggPSBjcnlwdG9fc2tjaXBoZXJf
Y3R4KHRmbSk7Ci0Jc3RydWN0IGNyeXB0b19zeW5jX3NrY2lwaGVyICpibGs7CisJc3RydWN0IGNy
eXB0b19za2NpcGhlciAqYmxrOwogCi0JYmxrID0gY3J5cHRvX2FsbG9jX3N5bmNfc2tjaXBoZXIo
bmFtZSwgMCwgQ1JZUFRPX0FMR19ORUVEX0ZBTExCQUNLKTsKKwlibGsgPSBjcnlwdG9fYWxsb2Nf
c2tjaXBoZXIobmFtZSwgMCwgQ1JZUFRPX0FMR19ORUVEX0ZBTExCQUNLKTsKIAlpZiAoSVNfRVJS
KGJsaykpCiAJCXJldHVybiBQVFJfRVJSKGJsayk7CiAKIAlhY3R4LT5mYWxsYmFjayA9IGJsazsK
LQljcnlwdG9fc2tjaXBoZXJfc2V0X3JlcXNpemUodGZtLCBzaXplb2Yoc3RydWN0IGRjcF9hZXNf
cmVxX2N0eCkpOworCWNyeXB0b19za2NpcGhlcl9zZXRfcmVxc2l6ZSh0Zm0sIHNpemVvZihzdHJ1
Y3QgZGNwX2Flc19yZXFfY3R4KSArCisJCQkJCSBjcnlwdG9fc2tjaXBoZXJfcmVxc2l6ZShibGsp
KTsKIAlyZXR1cm4gMDsKIH0KIApAQCAtNTM1LDcgKzUzNiw3IEBAIHN0YXRpYyB2b2lkIG14c19k
Y3BfYWVzX2ZhbGxiYWNrX2V4aXRfdGZtKHN0cnVjdCBjcnlwdG9fc2tjaXBoZXIgKnRmbSkKIHsK
IAlzdHJ1Y3QgZGNwX2FzeW5jX2N0eCAqYWN0eCA9IGNyeXB0b19za2NpcGhlcl9jdHgodGZtKTsK
IAotCWNyeXB0b19mcmVlX3N5bmNfc2tjaXBoZXIoYWN0eC0+ZmFsbGJhY2spOworCWNyeXB0b19m
cmVlX3NrY2lwaGVyKGFjdHgtPmZhbGxiYWNrKTsKIH0KIAogLyoKLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

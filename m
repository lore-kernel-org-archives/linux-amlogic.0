Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F52606A31C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=flyv42i1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tCdd5TR6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y1+eWNpmaLRal4He/3BLCPWqQeusA/hT1KxzEidrw7U=; b=flyv42i1Yq/5UDd08BQ1lObcsK
	bX9tv4adt5MApUAtreomarHcYJm1INrHyKwX6DpDrJDmjIC/MJ/vXs2Ycr8d0ECUqXfWSkil34lAe
	j+MHGuiCR8kmtXmycMvVkjb2fcwkV8Iy4qd9hqTfcncOd+PIBjIatpdgOwpKWfBwQyBhpYihBtZAf
	aM56YHedRDj+T6zjKSkO9Pjy/kUXsOdcflUvTPDrEzBS8nYpoVDS5zkG+n8CaWaeR2rVfn4Eo4xnV
	2O5iClfESJkj3HhLpOzMnlQz4HuavlHwFXj1RdEiTnvtnHlZAJgZF9AWDDKQDVKiRQvxk3GkPCtnW
	gdAcFT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcAY-00000008PX0-3Zmv;
	Wed, 18 Nov 2026 09:41:34 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcAU-00000008PWC-1pNL
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 09:41:34 +0000
DKIM2-Signature: i=1; m=1; t=1794994885;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:eXRa2qxVq4ijDvbLK4yz20+VPrIT
   VDmdNyh1qvoDcvZLP1a+MOQrFppJWk5fjRlxngkuSWTopOtrZi7qlHII9L9/Jg78cNqPiYDPor8
   Iz0NDx82IgGLQCk8+DtMA9jNhQ7UwgZN+18aaWcavVtyaOZ8KMfAHJ8wDP5p7AX4Y3edkOjeAKk
   CuNeWrWKJJja6cYvEHH5tt4n9YFkbC8ZBcJ3n0AbwCvlHX8gW05bYZ8ea5UQx0wV41IJqCxal9f
   zxbrRIPsB+tAEgF9Hu07vBTQb3feRTK2aIi6CkLJ9EgfseHx0qWqnpRpFAvuSoM5T409iLFSLGo
   jSh2nSd5BV87ZQ==;
Message-Instance: m=1;
 h=sha256:
   ur+tpk/Tzc1sr28lSeW4kdUlhIO/W2IjC2FOrSHSr/Y=:
   qDOYFe6HH3KN96z6UhHWrjJ3IOoAGuV1Br8H2PPMlwY=,
  sha512:
   9UIwWAFmRL0rO+NTy9LPqmOcfItrELoJ9ihZSGlXItuCZoiMz+wXvMyJVQ78fC/5JEExV/24V3TqWDFOkvpMmQ==:
   QV1YwrOiTa/1OVIPC2d7t0idcTwYZpwVollsh96zpqOoSES0/uSCpZ9h4nfK03aFPVhNLzXKyGc/Vik5eEViEQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794994870; x=1795599670; i=markus.elfring@web.de;
	bh=h1MaUzi4cdSoDZ2RrNp4EG1+iegSV9Ij1lRsB5KRzi4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tCdd5TR6Mwqk0sILeca70E5vMdJgyoSUdE4kseTOI8g1FoFlnItiIiKS3A1dZtnm
	 ZKO1xMz34dg+dHcVWShDvAJpvzaY9qnAM0/wpK4m5dC7YGAPhewlatJ3pIQ6kiNgO
	 MQq8gMvPvLxGBwmfO9ZiEsu/ikhHrqPKkhpjy6FV5h/c4Gp84zqdgmr7GMVM+9wlK
	 P78x4DXWONnP7B9emh2DMpl+Is2E0cxEkhKWtWz/W9QqMUIgbzBj9QjZL9pIBHQqy
	 muP7o2kVHQcVY3zNgj6mryOp3l6/zWqZrhqdsOJw4ukP9/snnKdKsKqL6BoyfvSsC
	 U8k0i+nUZ7IjFjkIgg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4621-1wTmKd0Vgv-00yXCS; Wed, 18
 Nov 2026 10:41:10 +0100
Message-ID: <1e02da75-0833-4a47-b190-cbc9f5346a86@web.de>
Date: Wed, 18 Nov 2026 10:40:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
To: Junyi Zhao <junyi.zhao@amlogic.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261118-a9-i2c-v11-0-68a3e79ff43a@amlogic.com>
 <20261118-a9-i2c-v11-2-68a3e79ff43a@amlogic.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261118-a9-i2c-v11-2-68a3e79ff43a@amlogic.com>
X-Provags-ID: V03:K1:aRkDjOoclPJCzD59wLaeysLvOGzVQ8RiibpOM+JRMDo96Xkd7YH
 l7yGFdyvaVwXqsNV2PSwdbKHbPYwJkQPscWwyeArF4daPC4TRSxn/JPUV5/jeig100EKRO8
 F+zBT4ZaKbhh0GCsSSnOOA80XimzHAaY8F3EiX7BOePxncOYRvP4LyQSPtKgQ0ZwpBbC24o
 mA6jegP9grT7dHUR+DU1g==
UI-OutboundReport: notjunk:1;M01:P0:nvfV6lCeulc=;WmgI0X2T+4PuUWSRPrUWMi4nwbT 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 vp4ozGQH/+LIOM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_014130_853716_3825593A 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

4oCmCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hbWxvZ2ljLWE5LmMKPiBAQCAtMCww
ICsxLDQyOCBAQArigKYKPiArc3RhdGljIGludCBhbWxfaTJjX3hmZXIoc3RydWN0IGkyY19hZGFw
dGVyICphZGFwLCBzdHJ1Y3QgaTJjX21zZyAqbXNncywgaW50IG51bSkKPiArewo+ICsJc3RydWN0
IGFtbF9pMmMgKmkyYyA9IGFkYXAtPmFsZ29fZGF0YTsKPiArCWludCBpLCByZXQgPSAwOwoKSG93
IGRvIHlvdSB0aGluayBhYm91dCB0byBvbWl0IHRoZSBpbml0aWFsaXNhdGlvbiBmb3IgdGhlIHZh
cmlhYmxlIOKAnHJldOKAnQppbiBzdWNoIGEgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24/CgoKPiAr
Cj4gKwlmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKPiArCQlyZXQgPSBhbWxfaTJjX3hmZXJf
bXNnKGkyYywgbXNncyArIGksIGkgPT0gbnVtIC0gMSk7Cj4gKwkJaWYgKHJldCkKPiArCQkJcmV0
dXJuIHJldDsKPiArCX0KPiArCj4gKwlyZXR1cm4gaTsKPiArfQrigKYKClJlZ2FyZHMsCk1hcmt1
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

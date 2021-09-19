Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144D3C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:07:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37BC60FC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D37BC60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4VOf2y2lQWtHLuoYCGMWzgnmlD6G36Dgw0Lgxiqjxo=; b=nZbLFzw9ItoMie
	fwYi9T+NJY+axpgqQ0+bgMc+4M06ElWNP8+Lh0QYWPMFa2lP3PP42zTgrwKNo2zKzmBrMROvI5nXc
	Ah7cbIWhNvtaxDrhSFRGELPTDcyUx74RkbmqeaKm5Kh+N/n/gV3rVRLgpbJ5rV+OJgNA5Uw5eeFDz
	fUZicLTLKseHdsrh6iDCNmC7VTYT0vQ0OrwTEHb2PkdzSmqHrRXVkymM5HmLjToV33jytAS4ysbom
	cai9r26O/VOLsXvMLsjU2RRU8p1NPuHxW7w6B3xzgT6Ix0bAOY8lKgMEy9xiyMYVqlmslCgDEOQSu
	6L9i6DpRYCNxGU62Hgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS36I-0009Ie-5E; Sun, 19 Sep 2021 20:07:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS365-0009Gl-0B; Sun, 19 Sep 2021 20:07:34 +0000
Received: by mail-ed1-x52c.google.com with SMTP id v22so48127016edd.11;
 Sun, 19 Sep 2021 13:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ju0kO6Sc7bStNoeex9OGswN16igUgEBg+yxA3VBWAk4=;
 b=clubKcKxMoX47ZhaXjsGeTaoUBv3AwKZJfFKDlARwk9f1DnMwyOI03FJSBvL3XZ+Li
 sOQC177t4QdjJDFRwIhusoD6mLHgpE7dXRsapTbPDullDElHA8M4jGbYFDIDYbO86m77
 Opu21eS624GwKeoNrLzt51EfV/KUN914KFnR1NCnXnYjOacmOiZZwQ6gYnOyUNslHfEn
 JPdXBYvkcAglHBab5YcpElR5qF4GN3kWCSEKsD/bK2cWuwrvuuNJ0YrdV5qwj+Lplo6J
 KMRF6SXSPojUSgUzKIREeqRMDh0xt8UFPvQTvqPoiLgAwlJ3RzVUBbvSjFfDL0ykErQl
 YpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ju0kO6Sc7bStNoeex9OGswN16igUgEBg+yxA3VBWAk4=;
 b=zIeV6vMb4qLUyrlNTTroXf8nN2bd3a95toQw+VeWSDIh+yA7Y/NZeZ6o3Ay/xt1HJz
 9x+6+XFKvgqm9ak/iRhgncUfkT65Y6e/LZe6xLfgzLd01pXkfBA0UPTQzGbQ3SE7XOTr
 seXK4rpeJ+EQM2OCjEmTksoXYWqnbWIJ77sr+G6+7qJaMeoJhCzoRBwhgRKl2/7Cyxv8
 AqxrJ1lAIlNfHvmnsAJFZVXFXLfctHS9+WrMdaFnbY2l7YPNADuqFVdu1tbQpQUmtIaW
 mdBQfizVg5NANMPxriIjRehySB0TX/AzfaisQ7EbYuT41OBEv8LxY25qLjVp4ZXQs9SC
 oY0A==
X-Gm-Message-State: AOAM5330xcyBTUH7tHIV9YPm+e355jaOgNz2TtPDvBndQjfroTZt9HD0
 B4pvgm3XImoqfwSQpceEfp1TaCbIh523TvjKf2k=
X-Google-Smtp-Source: ABdhPJzybjleeR39eCj9mdNyWJV9a4UnK/zq/PCBrx98z1W9NcTKcEAzfXYyPOvtFwXsoYsabiYCoyMI9FWbIeBV5dE=
X-Received: by 2002:a05:6402:358f:: with SMTP id
 y15mr24667243edc.67.1632082046514; 
 Sun, 19 Sep 2021 13:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210914142428.57099-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210914142428.57099-1-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Sep 2021 22:07:15 +0200
Message-ID: <CAFBinCAFp1FfRdQqKu3j3R1zsDFaeomcFB2DJOEjjKV6jJepTg@mail.gmail.com>
Subject: Re: [PATCH] hwrng: meson - Improve error handling for core clock
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-crypto@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_130733_089922_C0C9820A 
X-CRM114-Status: GOOD (  10.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgVXdlLAoKT24gVHVlLCBTZXAgMTQsIDIwMjEgYXQgNDoyNCBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKWy4uLl0KPiAtICAgICAg
IGRhdGEtPmNvcmVfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImNvcmUiKTsKPiAtICAgICAgIGlm
IChJU19FUlIoZGF0YS0+Y29yZV9jbGspKQo+IC0gICAgICAgICAgICAgICBkYXRhLT5jb3JlX2Ns
ayA9IE5VTEw7Cj4gKyAgICAgICBkYXRhLT5jb3JlX2NsayA9IGRldm1fY2xrX2dldF9vcHRpb25h
bChkZXYsICJjb3JlIik7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGRhdGEtPmNvcmVfY2xrKSkgewo+
ICsgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRhdGEtPmNvcmVfY2xrKTsKPiArICAgICAg
ICAgICAgICAgaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBjb3JlIGNsb2NrOiAlcGVcbiIsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLT5jb3JlX2Nsayk7Cj4gKwo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gcmV0OwpJIHN1Z2dlc3Qgc2ltcGxpZnlpbmcgdGhpcyBieSB1c2lu
ZyBkZXZfZXJyX3Byb2JlIGFzIHRoaXM6Ci0gYWxsb3dzIHlvdSB0byBnZXQgcmlkIG9mIHRoZSBp
ZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCi0gbWVhbnMgdGhhdCB0aGUgbWVzc2FnZSBpcyBzaG93
biBpbiBkZWJ1Z2ZzJyAiZGV2aWNlc19kZWZlcnJlZCIKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FCCC4346E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 10:51:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1246B207C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 10:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PoTGsDDN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UXbYZkLF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1246B207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5VZfjlH0OTQSPcp7lJuU4gGJgDd53V+9bc4dhoBMW+c=; b=PoTGsDDNscFLsB9t/GjHNkND2
	Kc22Jh8PaHRktgRIGIo/buDru9cRN7agXil0B6h8zS6UpwO0NA3bi9az1Ig3ct4dTeHDghLZySuse
	hS96EcHeT0uI0pxCsLkPKo4uEjvFzY7ZkXtzfdm+V5yzlUxlfInTP5IqYnldZ28NPLqZjSbi1gep5
	6VSmt7tIi5rTbLzDpHHKLLb8hRXU0CaZl3dEe+sE/VZWxuQHnhByUYZHk60JzeBrI+8CheYibpC3A
	csFWTWaQFMwedUvvhFlUnuQscskuE/yMaKT1oKcr8iLZf3fokc0vqfwwpvzE2MlM6U65Amt1RFiDM
	48pAjZZTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNDEb-00038V-SK; Tue, 29 Sep 2020 10:51:49 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNDEZ-00037C-Kl
 for linux-amlogic@lists.infradead.org; Tue, 29 Sep 2020 10:51:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id z4so4861408wrr.4
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Sep 2020 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to;
 bh=EVOj+H3sj7j1GQpbI5z8JTaPdr2HpJAxxmWpb9BQZo8=;
 b=UXbYZkLFTV0ctDsbt8HnAwm0or3A7XfFvrdqs3/ntS0QI1YxgzlilbiV2ym5Bt8ybC
 g1pkzV6dnnJe8lcnmF1wI/DNDK5DcRfao1t3cW6aOZRGNj6jdUIs9OdJLLyeIBg9gpTj
 99fgAM5w4RosRsnR7v22uNAftYMgYUHuGBppWlFcAbZ2FNIjeNKvDO01ZQSu6zk2K1Gd
 JnCYB6duS11NM+DjJ19xIOtjlRO2HxVW6ELcVXYPlxQI98YTZD3V9y+6mQA2iUYrW4tb
 fCm/smUTT657UHd1jDOzZ4i8nwoU6bqNrZO8OnfbryKHIMVJGbbM3vjNUz9fjdF2Pz3k
 82jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to;
 bh=EVOj+H3sj7j1GQpbI5z8JTaPdr2HpJAxxmWpb9BQZo8=;
 b=Lv9nyBNgEstCP8UNH5c+RX/X893vHsMWGpDeXOt/xEU8+mfJKpKDmjnYa3L7nU7+O3
 20HSMbY6QcwUDvJY2p+ys6Exax5Q1rUTKKod9eldCOUMpAhBmqT8s0g6yrPKDzCnMu1o
 12+Wu5v5m7NkhzQx622pleuMwslLCztbHmBKJG3rg9UKgiPd7JWJzdod7GmTv/yCW42N
 nKy5rlXoPtlOHhBpfa6WHfqdI+dw4VHIocqonM4IVOAhPXtsxlVf5t3vGZNwOCHZh7Em
 qVtyf/1Cjz92cuivobrZgkzC7bFTcBXOU7mGInlL+/cYm3A97Y6++mYCCt8aXw8IcIwJ
 hORA==
X-Gm-Message-State: AOAM531J6wPCIwSx4EP1bl29xjCR3Zfko8HV+mnTQUBIilaZjIn8imxX
 K3LZTrEgvMjyDgVHgTE1aaI+Vg==
X-Google-Smtp-Source: ABdhPJwRNO5KjW+wzVW0RM/c+QWZABavjWqGX9OCL/0b3m3SLK1HjnQH/CiTGtomlrewoCSfsiQjKA==
X-Received: by 2002:adf:f24d:: with SMTP id b13mr3542409wrp.316.1601376706335; 
 Tue, 29 Sep 2020 03:51:46 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:d50c:1ee4:fec5:ad12?
 ([2a01:e35:2ec0:82b0:d50c:1ee4:fec5:ad12])
 by smtp.gmail.com with ESMTPSA id h2sm5568722wrp.69.2020.09.29.03.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 03:51:45 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] usb: dwc-meson-g12a: Add support for USB on S400
 board
To: Felipe Balbi <balbi@kernel.org>, khilman@baylibre.com, kishon@ti.com,
 martin.blumenstingl@googlemail.com
References: <20200917065949.3476-1-narmstrong@baylibre.com>
 <5e69947c-8a91-af7f-ed86-996920109e79@baylibre.com>
 <87eemkan4b.fsf@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <19298358-8e10-3efe-b246-2ab6662ca715@baylibre.com>
Date: Tue, 29 Sep 2020 12:51:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87eemkan4b.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_065147_742280_48767009 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7757873328837717649=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7757873328837717649==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="PvDOpjJ0j7br7XXNxREgp4JIFBMJrauD2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PvDOpjJ0j7br7XXNxREgp4JIFBMJrauD2
Content-Type: multipart/mixed; boundary="yDwgYfujpTqYes3nBEImurklNoJRPjlwF";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Felipe Balbi <balbi@kernel.org>, khilman@baylibre.com, kishon@ti.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Message-ID: <19298358-8e10-3efe-b246-2ab6662ca715@baylibre.com>
Subject: Re: [PATCH v2 0/5] usb: dwc-meson-g12a: Add support for USB on S400
 board
References: <20200917065949.3476-1-narmstrong@baylibre.com>
 <5e69947c-8a91-af7f-ed86-996920109e79@baylibre.com>
 <87eemkan4b.fsf@kernel.org>
In-Reply-To: <87eemkan4b.fsf@kernel.org>

--yDwgYfujpTqYes3nBEImurklNoJRPjlwF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 29/09/2020 12:33, Felipe Balbi wrote:
> Neil Armstrong <narmstrong@baylibre.com> writes:
>=20
>> Hi Felipe,
>>
>> Is there anything to change in this serie ?
>=20
> I've been waiting for Kishon's review of drivers/phy parts. I can take
> the rest, but without Kishon's ack, drivers/phy will be left out.
>=20

No problem, please go ahead and take the rest, I'll re-submit the phy cha=
nge
again if Kishon wants some changes.

Thanks,
Neil



--yDwgYfujpTqYes3nBEImurklNoJRPjlwF--

--PvDOpjJ0j7br7XXNxREgp4JIFBMJrauD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAl9zEcAACgkQd9zb2sjI
SdFBeRAArJuXdx4qIN8mEblC11uiP1KeUSBfHYt5iwk4MsbYaLyrBmFGXWdyDLcB
3H7Skedxe7v2UuwPilIqC7oCLlturhy6im0LnJmfhiErx26iKZpybotGGbo1lbKU
NdcajiYY2eOkEj+ddi+Rwh5+LE5O3m4D4IqVAr5goCG42usaoE95tMTmjc0pgHP6
WXZX3JnzEG0wkjXcugttX6+8srjn19Cey2n2UF9DDi+Kcl2OXAbIV6q9sCx55Q9t
FCezOnhuk5YSVX2hvBKu4lCjOKGlC3DFNSYddZXa6PC7ggXPjVt+kIOK+uKWIDYL
P5Bc8EOwHoPUu8YmpZm1vf9ru68SR71EovUA5hFvSVJugblxVQZhHZ3kEf1otdQ0
HM7XiN3TBfBh5AX80zY+pGXz/Rya0yL3WPWXC2BcN/UYy1AUy+NeXMQkBACvtxsq
avVjgog0uePZ6lJ5U9972OezpDVs7iikpkYicgkTU2z6Hc18Ryx/E/4mcRbxQmKa
iNSO/tS1VP2JnBdSDpl9GtcmmEo+AgIQVCiFbREt/qKpDGMj/F1LDFRCbBcCv5fR
z+WUzYkhJUH8b+3vAcRjxTOva9Ep6D2TcdmJVsgJdInZX6j1R5v7xX5kl/hQ53aZ
8KIf7u6Syr7DsrKfRqICnCxkV/cgH1Yn2zUs2lXP7V57Cv8R5j8=
=H8F4
-----END PGP SIGNATURE-----

--PvDOpjJ0j7br7XXNxREgp4JIFBMJrauD2--


--===============7757873328837717649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7757873328837717649==--


Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC2C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Oct 2022 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCyXblIFYxc+KYOYmdMSIQIcXS/7BYOt5GC6ic9LsdY=; b=3asA/jvOOA46mNpQuaQ/BnH8OH
	FqZqIdD9F4LQHiyUSJDu/68R+sMp/t2HqkpXHhK61917me5aUZSoVQSb6HaMvKQjrfzr7nVElJriF
	cdB0eN4ECTWlveclkS5Sr6L9qre6cqPo+GcIvZRGdBUqpAEI9nXDhLiYALK0GzmsebvesMXxkYTja
	ESib6Sf0LZgPR5UoKU+ZatQzdMEx5xv83A3iloab/TXLGTtxOTQfvZHi5YcRekBzJuT6HlvuxqfaZ
	yXoYnXXFnQsHvkm+FSLmmgYcEnW2W456PzeivYoVym0fFYbPyOGTh1Xa3xh7uFA5PExoWMoOQTQUA
	BiHLKDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onfkf-009ELu-Rc; Wed, 26 Oct 2022 12:43:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onfhO-009Ca4-Uh; Wed, 26 Oct 2022 12:40:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B022A61E9C;
	Wed, 26 Oct 2022 12:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2527CC433C1;
	Wed, 26 Oct 2022 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666787997;
	bh=nZyuqLx+6uxbjW68/34pb1i0VYW3PxBvAZFlwinx2VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KA7mHixe8OKOC6B+Xwxv6zB3L9nBWHSuxKyQbnYQnGc068pBk2NLmExadnS8jvpFo
	 kAFP2G9+a0TFrLfZT4awiDBxsRa5XzHbsz4d7kXDhBENVbDdxHAqjTfSWIipjXRUxx
	 DgKTOpfiDhsVUtq9NVrbg+0NjZlDTkXeZJyy+DQ2wHBhpMQ9F3megj3JNuMUSpAfIF
	 89fpc8dBHpJWOzp94kfBIJMtQPCUkeU1X/yGhHBOvhrngrjq43f+bYZFIBecox87PJ
	 2+EzaYcjhisEArVTBYaHCQENAgRwCkRk82amO+m32cmiP/2H96NYBxi+W7uoomdXo/
	 z71VbjGFhVNVw==
Date: Wed, 26 Oct 2022 13:39:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, Da Xue <da@libre.computer>,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH] spi: meson-spicc: move wait completion in driver to take
 bursts delay in account
Message-ID: <Y1kql/WwAX+ZV8us@sirena.org.uk>
References: <20221026-spicc-burst-delay-v1-0-1be5ffb7051a@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221026-spicc-burst-delay-v1-0-1be5ffb7051a@linaro.org>
X-Cookie: Prunes give you a run for your money.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_053959_088436_AE7FC13E 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2318829337032851455=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2318829337032851455==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OiPSywjFVb7KoiNF"
Content-Disposition: inline


--OiPSywjFVb7KoiNF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 26, 2022 at 09:58:28AM +0200, Neil Armstrong wrote:

> -		spi_finalize_current_transfer(spicc->master);
> +		complete(&spicc->done);

No, you need to call spi_finalize_current_transfer() - you need to block
inside the transfer function if you want to open code this stuff.

--OiPSywjFVb7KoiNF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNZKpYACgkQJNaLcl1U
h9C2AAf+On8ZkqQcFewrYfuP8Ug1PJmIq/gmECvUtesQ18Y+vaANvc6kZTqPGAYL
H/WQkFsjFVQv+tEZLvFbisejDOcA9OL6Z4dnFsE+LFJdz/1typ5OySErgvOVco0N
+PqpGoRjI8gy6cy3vdSi2iNHBx70Xp5Nz7yLJayQyALu4+h6WWywuk1NL/dTJ9GJ
KSfIEbFcazcMZsPlzeyK6NCSoMZOf3ebU0VLqicsH9ONKjDoaBg9Zs1TZm4hcwlY
vWxnN/zejXyOcEfYYYb7JE6oxhv1LcifxtxDG08Vf0JcdR/DzbmUgjDppXZRZF9D
o6RTZ26fjdxtWwKIL3IaXI/1cXJWgQ==
=9Zpz
-----END PGP SIGNATURE-----

--OiPSywjFVb7KoiNF--


--===============2318829337032851455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2318829337032851455==--


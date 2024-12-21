Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDF0E77184
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Dec 2024 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eutv4XcmjQ/Avi8Fo0XGXDndl/E/zR9t/7iMHQFCQH0=; b=U5MPHVROcAf30E
	S+ehcv2VXBxK+BmiCFNpz4ruaXkDtkJGQQm9mcgJWOXqNEZE4kOWE3ZP5w0IOOa8YwGKW/sy+gyFk
	tA4+yL7hgbCZDSFUfBZ6pyssaDKmdI4c5cgzsaHW3S8xrQ6owe7OvgQo0vxkl72oAPSjF5vrKQCob
	0+zQTV+L+weQo5NjOgk0PPNwNRZmlQiVtc05EbwmTf17Gv3wqxlfEMfBVdSL9RvcCXQ56Is+n+Ejy
	NjvKIWzb2AzkvPkkaqUpFOXdBDkMna2CML0wP/XlAYbtLZcadMK/oFWgZiDzoNLApCIS9UIX8cTk6
	53EBEkdUKIt08k418ivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOxqT-00000006vLe-1Dsc;
	Sat, 21 Dec 2024 11:40:33 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOxqQ-00000006vFc-1wDY;
	Sat, 21 Dec 2024 11:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bQUIhxAkFMv4zgOFr0fbELlHZb6jERTJ/olL7lHSpiQ=; b=pZ8VGzYvFkFvpp/zbDpbS10vDs
	WiHBsDzQgCU/VvUvyq4x32+tFiQkzcGc+GKbBJ2vFB1YPj5LTYeN1irBapdglqedGMiD5LUXHAqYB
	Zqgu0KRvd++o6i1Sj/aDB4z8pPM8+xXktrOPWho1rro+2VPnVfrYEHb7OengIYcOl8TelXQLCd+5q
	/M+DA23z5DAfesBZntdMeEIZ1DIzKSqskfgBs4Z2jfaJboDiiB784OF0GwyacMIFHjXlYR97xLNOC
	0xoxYZE3tB+ccktlAxsEi+VV26w85hUW6yWoMOl8jqvw6mqf6VIs9vZodTq7DVYvT53MEqAKjfYY/
	R8rOuAiA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tOxb0-002QbR-28;
	Sat, 21 Dec 2024 19:37:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 21 Dec 2024 19:37:55 +0800
Date: Sat, 21 Dec 2024 19:37:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	vadim.fedorenko@linux.dev, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v11 11/22] crypto: amlogic - Introduce hasher
Message-ID: <Z2aokzSrAHpJE_PG@gondor.apana.org.au>
References: <20241213140755.1298323-1-avromanov@salutedevices.com>
 <20241213140755.1298323-12-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241213140755.1298323-12-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_034030_508308_239ACC9D 
X-CRM114-Status: UNSURE (   6.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Dec 13, 2024 at 05:07:44PM +0300, Alexey Romanov wrote:
>
> +static int meson_sha_digest(struct ahash_request *req)
> +{
> +	struct crypto_wait wait;
> +	int ret;
> +
> +	crypto_init_wait(&wait);
> +	ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP |
> +					CRYPTO_TFM_REQ_MAY_BACKLOG,
> +					crypto_req_done, &wait);
> +
> +	meson_sha_init(req);
> +
> +	ret = crypto_wait_req(meson_sha_update(req), &wait);

You cannot sleep in the digest function.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2173CC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:07:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED49120859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:07:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W9vJ25Pt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RdiX+5x9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED49120859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3PvwV/QkAJ67Fgfe3IrDlgGxJCN9z4VZ2m9atVhxsI=; b=W9vJ25PtwFwoQe
	EmjOYRrCpRJtkDXv1u6M3dkaRvvf1jsdHeYXegDhv7ESxkBIzR0ykewu/u34THyZN0hzlXwDBifKK
	eHvFWP7cR8R1pSqDsnLtsfdjKmpspK+QPaxIFwOB2ShCiyYKV1Fg/vEA1Z3kR6nAVQsfXAt0PPjjp
	28F37sjAWXDWwHQsB5wlrouJWICovmwQr1DgX/83cemmIBqy+/6aCfTDCCeMTv2XbafM9k114Hcaj
	OVQuJBDbddbWMbtXGbQI2fuK0RKpZTGz1j4RR8YE1d9UfwFGJKSNo3B1vSBKxxhQu2YYEWUOWz38E
	dgQa9r38U93JKn7+FQTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK2D-0004x9-28; Mon, 27 May 2019 18:07:45 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK26-0004mW-VZ; Mon, 27 May 2019 18:07:42 +0000
Received: by mail-ot1-x343.google.com with SMTP id u11so15485672otq.7;
 Mon, 27 May 2019 11:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pgdAS9QmA+kymmNkQFCc70wQxZNKe+LAPHfdbYWWNfs=;
 b=RdiX+5x97w6OwJDSWefjcNdvbOMuBwDoYzdemIbi1EC9zJY/jnJxjq73rbhPUy5Gp0
 5WcerhbzlpmR8zxHrLCmMNTD0AwH4OziEYn2lGl+CvWL58RXUvfAHVxAraZg+gQ+dvQo
 0XNeO96gK+zlOa5WVuhJjfgRP9auy6lUqQDYRwCbD5pnfj5lxLJdu6jvbUgKrXFjJlcy
 WLXe2IOIhKfDcra2vZlEenW1HThjLw4og2SLQP1wxPhcrzgi+H+iFrqzs1VlQO+oF17W
 3fpk5k7RmMbYga4hDydvtqMA2OAaE79u28vhaEscZatdQ3X0iBX+SzuLSAgnw7CgUJkX
 QSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pgdAS9QmA+kymmNkQFCc70wQxZNKe+LAPHfdbYWWNfs=;
 b=oBFKXnytCBY/axY8Z6HzcAyyi1T0aNGZQd0LHa7hgzJNlFQMSYlTGaJTs/TXkfW5DW
 W4qmFaZz7GTDZ8PxK832nfxYCDganTBUa26ZX2cuaV63PsqZMc0SQlmGdw6eMIJqwMWb
 os5koWaKMjGlYQRxgOJPwnT1d44JYbRfybI7HTranJKHNRxA32Rg99L++6R2F5uAeP7+
 rGNr0Z7xRGsipbchC81uEl2W49hFwgIhEClfnN1XS6kumm+gvyfVg8kPKON5QX9HIicp
 QcnSy92GaRkHI1+g8nueHdir4HVK9HEWwyE1xvmZ2DtljG4xiaiJz3gOLltYzFLlqplX
 nodw==
X-Gm-Message-State: APjAAAUEDMDrE86bf9VhJMuM0A5RS789FkYwDjMDbHGYRe8MVYY5y02q
 fQPLoi2rAAoigIlAk8s1U+BWENxGAA9b/TM9FWU=
X-Google-Smtp-Source: APXvYqyAOgJ6VVk72xMf8ZhSixSYxxi37uMWq89IE4E5NvqQ/aeeb41CgR4FNVUgkOF/sHyiicjwCR6Kz4EyMPOQ2ns=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr71815029otb.42.1558980458177; 
 Mon, 27 May 2019 11:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-8-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:07:27 +0200
Message-ID: <CAFBinCB4Ss6S7L2J6j_gVW3yFVW6puysGPD+xDO536-g15uquA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] ARM: dts: meson8b-odroidc1: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110739_602817_4088C58E 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:40 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> While the text specifies "of the GPL or the X11 license" the actual
> license text matches the MIT license as specified at [0]
>
> [0] https://spdx.org/licenses/MIT.html
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

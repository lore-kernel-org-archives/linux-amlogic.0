Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C5BC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:15:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE5420859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UQ+pI++f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tSvoWWkL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE5420859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XTiP95ASZhJFaBmSab3Hb+v4/y4L2k3gAWlbiDMKls=; b=UQ+pI++fOPHsBa
	PJ3B0GHzgNXh2YwvyspATxH6NQYEtGse2Nm7YW6WR5vNfAXmAy6BXmig91UxtN4IcOHPP3t41ugjV
	7R4NtbXMPfAhE1JiGSYrYvlYrXILsV+F4JALkEWw3qLoir1z/H+y9knMqZBiPVg0WeT1e4x9biuQO
	5cUgplrDd7Opm4SWWekX4fpBYJUUAsLrTc/B/deB0aOXxARi8Iaspnj2dYQnNmSy4NACMreHtIKJN
	tO9eXcOzY7ltxgq/dP3ezfZy7i7NXghhG20V2KqMnjJLUGIN0iWxhExmH+WBE291o4ccez3myiBko
	SDQoaUnMB5Z3+B19w38w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK9z-00028h-NB; Mon, 27 May 2019 18:15:47 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK9r-0001wh-0a; Mon, 27 May 2019 18:15:45 +0000
Received: by mail-ot1-x344.google.com with SMTP id j49so15466452otc.13;
 Mon, 27 May 2019 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CZXI0Vn72E/kvqUVtGm0iU9miuWChUM3kAYpzpVGfLI=;
 b=tSvoWWkLsY1P3+leYGrD5X5mo8Xnvw2PuTio2xXbcEWt1z6dDw9GiJpKsm1oJTF99b
 fua5Ifgyz51Rodgs5JkfzurKlGPoPYJdBuLN1m7OIvMoRemkDDdZ/DrNo7Tj6AT3/O+g
 hvuX/BVFs+41JDZY87oxiQcURLyGoACEjyGRe+Kj/42h4Bjc2ddBpQwWxY3FuKhkUjw7
 CzbYIRM24oxp75+WPr1CAzTjmoXRl74YS99VRGYTXjtF4u7pDRKaokdXGFuQ+/oZrbu4
 7wfs10chpRgTZsdocsWxitwrK2bByBfUSMB3bpm/RC9AtGRaRTl9LGvp2Hu3xyfRyxEd
 zQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CZXI0Vn72E/kvqUVtGm0iU9miuWChUM3kAYpzpVGfLI=;
 b=leEPXUzP3anrWWmQGomxWmKxc9g+8HOOu0wHc3jHUX9fMDBQfvBwg8/q5x0CD2vWlB
 vecqZIXj5W4eF+x8T1WmbzhsQtUHH5v9+KERsA/YnaXji2oQa/aobaggyMXJbw94lKG4
 Iml4geGPn0kpBb0h8TXn+TSv/eb5ofTedZ2lsAZbZPDy+I83H69tju+yLsah/KPT3lPB
 rixnbDzKhkqXWipJ1Gmb5HCln+xqD1XMW6M1vO9kUIvkWzb9TAZZYiKmaDvx8h+AqdOb
 3S6AOtpgGHpzW8vYZ0j/kFymKjbznhGsyuFrxM0/zrJP6cAceAC9SGrYIyXhKvA8DaEn
 aQ2A==
X-Gm-Message-State: APjAAAWgV6sAY8M7l2ixul9tZ3+zzYTG33+oxoVaaXHtRyNaO7Me8Aeo
 zEWFadAWvlUSwajtzwI57EnHhh9apdL75sLqMHE=
X-Google-Smtp-Source: APXvYqytYrC2eskykBQx9xuR6VQWqrtmKRbQrCEpy1SQnswhueDhG3nDNwT5nAwRtA3pcFaY0y+7otf8sm0gM0iP2V0=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr71839920otb.42.1558980938237; 
 Mon, 27 May 2019 11:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-4-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:15:27 +0200
Message-ID: <CAFBinCBJwVT0uMx--NPuuAYS7k2Zx-X-Ew+qNmRQiPV+Cmv=KA@mail.gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: meson-gxbb-wetek: enable SARADC
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_111539_691455_F43797A1 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: khilman@baylibre.com, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:22 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Christian Hewitt <christianshewitt@gmail.com>
>
> Enable SARADC on Wetek Boards.
as far I as remember there's a story behind this (and it would be nice
to have it documented here):
some of the SCPI firmware revisions don't enable the SAR ADC clock
when reading the SoCs temperature.
if the SAR ADC is disabled in Linux then the common clock framework
will disable the SAR ADC clock.
now, when the SCPI firmware uses the SAR ADC to read the SoC
temperature we only get garbage.

enabling the SAR ADC in Linux "fixes" this issue

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
with that:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

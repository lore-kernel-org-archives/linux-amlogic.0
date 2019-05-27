Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E833C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:06:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57CCE20883
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JMVIwyZs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HFfUxrJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57CCE20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXlQiiaQ4NiM9d93iOec1zZHQoYH0wYdfE0/aRa6XLQ=; b=JMVIwyZs3jRtLP
	xa5gEk4QOVWaqv7cYN+HEKkA/2FKrS2DComc3HUR9hxVbAfcu7rHIGtZSb2ot4JilFSZNeLBbP+Jt
	M0IBn4laf2SmDthyPGJZSSRgjiUaZzZLAyfvERH358N7RRo061Fbr2Td2+gDYyvxo6pD4odVv3R01
	SmbucAWWlzwiviiVhlkBwvMPhWSf6E4KXoRyYlh0hTpMJX+Iw0g6ROdrDarxRxNY4wCUeQnmrnzXQ
	rHvutQA2SVLzmcg8zgbBEaFP68mt98I3jAs7EeRk9Ds0paWAwJKbDkFQQ55e0FLFfZ5yO1gKIrdm1
	hvGvbhITeYdr3x0YP+JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK0S-00031P-Tq; Mon, 27 May 2019 18:05:56 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK0Q-000315-Gw; Mon, 27 May 2019 18:05:55 +0000
Received: by mail-ot1-x342.google.com with SMTP id t24so15472684otl.12;
 Mon, 27 May 2019 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TzjIw5BLJk5drmWsGbwMcT1IBdvLRxaPnalQTSSBes4=;
 b=HFfUxrJhSYm2j8/HILqhg7e2ofeY9r3RcjD08fQe/AtwAyshGotCU0QD2P94+IP4yF
 lmbV61UJFI262leGz2czn5IWnK3/vE/mGGnkPgG9pAsXSP14vdqNMg374KhFtDHe8OCm
 VKWEXZwfnNnR6Uf/rgZ3ZbW4EDgagYKtCTsDyh4ZCf9L+P+e2JBxjQAKHpugULNHWsw/
 mCTiF0GQt1Y1BqO7X5YtBwMgMOR6GKMiW+4WqN93UE3cQ2Cz20m/20Ab7zHDxYH3nIUQ
 uD0qSU7sN/GwjuEDtUGoa3AZ7WMs1OsTw1LMnYEdp2+lHsmz77yja2LAikHUo8RgzeZk
 95GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TzjIw5BLJk5drmWsGbwMcT1IBdvLRxaPnalQTSSBes4=;
 b=D9JjbGATUFry3vGB5wOFDIy4plK8HN9C6ANoUul25dFYKxndk05LgGXv45Lvn+f0r1
 ilHQWxsw6/+UVlibj420eVjeybbAXpYALko6AS9TjlkpiDZ7zx8rBvgaQHMowB+Ygmwu
 mFXpRP9qkwte7x/pU6oT8OkWMz6c3nE31mFEMQiS8zqtGdPttk9fh75r1lc39pNIfjB0
 TtsS0iZKC31FXHg9x09Lh0QHfISC0/I1nSSRusQfo9f448seI0lmo77JhI7ggVYdAwSp
 Sm0gLThlrTYDSVrj3o5eFb75GwbOjI31kbcT9DI7/xE2sU3yBEOwqdAMFEFOogxHrJIZ
 BrMw==
X-Gm-Message-State: APjAAAV3SouLqtaP5SDrYYPOmVU6fwbto6YUsujPTBDGkgAgkrArEWts
 eKtKkIqxvXq/bpfbSTgxYxPeYhpIOZm9h6hAhoI=
X-Google-Smtp-Source: APXvYqx3kFWQFTkADAuGfjyGBlcOq0Ix3CuPnZhJhi9h13tqc0aa+NCakzhhRSzvyADIx87mSurffOEPjsyB55kp7Ew=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr71809486otb.42.1558980353780; 
 Mon, 27 May 2019 11:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-2-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:05:42 +0200
Message-ID: <CAFBinCCz0v7iup21NBtsxDxOYXESON3TTFOqfurRHei3g__7vQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] ARM: dts: meson: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110554_558921_8272901D 
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

On Mon, May 27, 2019 at 3:39 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
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

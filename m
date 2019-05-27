Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38791C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:28:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07572208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLj+x0aQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="U4DCnRER"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07572208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQ8dQ7OK8VbR0NS2K37X76OotX4GrEXyDX4YVQgE6wo=; b=CLj+x0aQqXfFJ5
	Nd4IZnYKebVSGCcTUjuLgbZNG/+b0kW+Rfb7hNz5USnpNnBapy4glJlYry4pAPgp4V6Fuywlv/CWL
	Eh/O/REYj3Q1n6CxEykf3EkEnxFaXnhUbaAdNN1/sYiQw0YqgTJGOim8+BuSubgqbFRU4W0ja5I2S
	rzTO5SBnBusR4SWujavrCyq9M74fjbNm10ZHBojkP+KR4fOowVh5RQ3H/pMTvzGwD++HtPvuXRK9i
	M76cf5CKSup6F9d8x7mv9fa26nanOKO6Ti4/vkPnNepMfA6tb+mSA9C0xuudw+Lax0zR8EQtewfeb
	m3kwcjfbHh25LbQqnVFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVKLr-0007Vc-TC; Mon, 27 May 2019 18:28:03 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVKLp-0007VH-Iq; Mon, 27 May 2019 18:28:02 +0000
Received: by mail-oi1-x243.google.com with SMTP id z65so12448994oia.11;
 Mon, 27 May 2019 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wseEiwf2iDxEx0rB6+bstHWLvTH8+Jm8S/2DOnZEoi0=;
 b=U4DCnRER3Bo6N+YBQxNx5r8BgFCch9KSnniaEr49R7m55UNQtYzfvpxNgR0+hZ07dk
 ruQ0Sn/8fhPl2/tfFl6c2jn9N2fIdH+XhAAXLvCA4kqSAwyHFw7eHic6OZxxPXL+AE1k
 H3TbEeSrYrXRSTzCaxdNCYQ0h4NhvWgLwWh6D4sufX/FXiEmldm7jgDK4QKI/LSRyWYS
 Kz7OEw5lcbqIzeigKpu8jNJ9dCaIfJW8siWZZ8fDOa48812IBYJ/86Moowk9etD/dmWS
 S5P5JVOBPr6OXKKwv1mvSuuYYiWNywvQSa66j+CN+AuD7RqiRbn8xIhIzUjRjhHPuM40
 f0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wseEiwf2iDxEx0rB6+bstHWLvTH8+Jm8S/2DOnZEoi0=;
 b=i45Z05CfywNbMj/VOlqncVNLN5Cb6ydYsynAevij1bMs02g1fGS7Hjc9jH2rxukily
 Lfu8/kHMaOZf6NoLJAliKuRG5EdzlUQ//OwY1TG2MyZE0Qh2ZbMZzolHhm3jS3Jz+GLo
 TPWG/QU13S8WizOwJsnvot3fh0gqKk0xtwRxX8AbGRU6cOzIHLA8Sk3OOtcnqL2WZHLa
 Jyb2DhHa14vT28wJvi9Su5DboAbCm3iWSbVQQq+OwfBhAxHkTEft4mIsDmdKKvRjLXkB
 qY/l7XqaZ38fzOhhhGkHYv9HK8VmS5RTUqwTxTr9wmgvQNrUu9N3yDfGWU38wApbDnHf
 h2Sg==
X-Gm-Message-State: APjAAAXWXy0637Bi0oHk7ISJaWr8zzACzWkHjIRgg0hPPDL/vXRrkbo9
 YfXqZZrxBXGAxznfXg06/Zh4yBXDpPAr/F13GPU=
X-Google-Smtp-Source: APXvYqwbfigH3TZlE9H2ckoSvg4wg8rLamp2jsQJnsfdYO0iUsmSoQWOoyFjfHYjDukhRzfcHFO1gwm7ahn3PyklXkU=
X-Received: by 2002:aca:f144:: with SMTP id p65mr194565oih.47.1558981680480;
 Mon, 27 May 2019 11:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-10-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-10-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:27:49 +0200
Message-ID: <CAFBinCBZr7nSnNTGO5upowuT48-pcR57VU7-zaxZ3Ocb-tZ1sA@mail.gmail.com>
Subject: Re: [PATCH 09/10] arm64: dts: meson-gxbb-vega-s95: fix WiFi/BT module
 support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_112801_620646_158BBD9D 
X-CRM114-Status: UNSURE (   7.68  )
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
Cc: khilman@baylibre.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:24 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Fix the SDIO WiFi support and add proper Bluetooth support on the
> Vega S95 board.
>
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I'm the cause of everything that needed fixing here. thank you for
taking care of this, the result looks much better now:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

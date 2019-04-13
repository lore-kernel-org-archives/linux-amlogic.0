Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3446AC10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 12:03:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F4E2171F
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 12:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lUZhe5e4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MnyMZG+I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="a3ahAyDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F4E2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaZ9A6dAK9LkSrXQflUnqG3HLaJkWCKK9zdOVQtRHOo=; b=lUZhe5e4KD78d5
	FIqvp28bV1g22tX93PethIa6mpzHj4D9IoZ/eXknnfMhAw/QbofRgO602ohEUOq/uYUuKcikoTTtP
	22xjANa7OVtNwVspmIk3UV+FVJV0JGQtQNc/OoyLMBQxWdwdvEW9PrNjcDhcqH8eDggMm2jQpUreG
	6yZQWgJOb2mnbQ9pRA41NrVYNFpo+9+k73kR3wKqpqlL7Pbf406a9llKZJTzuJ7xcpSlSSuMHKaL2
	6wXA1HHSV1/gF5F4z5Kk5dYiWOwPEF0T1nmgZ5rV5fl5m3FrzXXRYYdo+005NkaYz+kYwD7Wjcbrz
	h78v4jOyrDDrFarAxl7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFHNS-00015N-EA; Sat, 13 Apr 2019 12:03:22 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFHNQ-00014x-Gm; Sat, 13 Apr 2019 12:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6B0/4N/GgHHkXxtx0LaRaz4Tldr/FyYIlrssUyZNuJg=; b=MnyMZG+IGVtPuml0Uaec4UvnD
 TfX4s9njrtEPrf04irFVG925BexGvjsGNhNRHKbMmawxV6JFBNsTxCIrH1NGw9BbjVYxuFgTPVtQn
 16QagGjzYLP7f3lk5vDksnO9r5DZQlA5fKFfOppAFY3Dgj1WSYbTyOaC05mEQfMCQLLp+XOjel1Ir
 uL5BN5PyjHREuA26yVfMpK2KiYLhHLcVZjRLa/njbCyTqHb9U1a+lfW1ENwKBUpwsd/NTBlmI+r0i
 vEV0pX1oS9rODs/bbtb0a3Q37LBug9eLBq6T5uUrGvppGwRvF6AH8lbLjpCh3mkUHubjkBSQQ5mPE
 vdD46LvDA==;
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFHNN-0000E2-3r; Sat, 13 Apr 2019 12:03:18 +0000
Received: by mail-ot1-x342.google.com with SMTP id s24so10647563otk.13;
 Sat, 13 Apr 2019 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6B0/4N/GgHHkXxtx0LaRaz4Tldr/FyYIlrssUyZNuJg=;
 b=a3ahAyDSoWAsNWJqIgMOvYDIVZjjqh9H307hAu89hMVscpLRs/JLipPIyCEV2GmhrO
 vFZDaLNeYmJEVEqB8EhcXdgPXBsF9nfevTLmIsr/5i+5Cm8+cDP+jicpNh7UipSNMKIC
 I/3UL3l0nL8Pc9MmJVRdtSXFj80BRvQi3UAbUZQCaGehPqk34LOVN2X1EsVdXtHLvviy
 pPA42/fkpYbXPsjwMIYmTdTq6SL9VdiWX579neehLvKbB1JzMUvjkeb1lV0SUX3qwe9c
 KWXFSynkIkuAMf73EWWbwfXPnw4FfoUrhji+kq/UGLnFD1FK67II8WXoWkeqE/g2ddrB
 V4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6B0/4N/GgHHkXxtx0LaRaz4Tldr/FyYIlrssUyZNuJg=;
 b=loLJl4weQWJpRmQXwvsK+cYZjZCQJcs8EPQ1JyCeOAZKVT9kxDqo6GvehsK9gQczYk
 IsSAJSNvDjhG27AG2AdQw43Na82YbT+KKerncuCZvrbxakrizFUp0S+ZQ4FoOIMfJ0b+
 I4gnS9ktELSLTAI1glM66QDBWpT1FavSdahom0fC63EbfPED2JmUcmjuXO3LkkSAi9+v
 biYjM5gMDh/+fshm17Xl6LOhbQmztMa4iWDI5oPVwbl37nx9lYkRNzOjAheXu6ZUJyOC
 wasGeK6E1E3W2S8VspugVL4JeM9hrpNoVfUbrG4PO6mnvEQcDKKut3icGRER9vzwEwAR
 t6zg==
X-Gm-Message-State: APjAAAUf/L2J6hqCs5VyxJ5tK0MJJJ6VBfjcq697H3kXOMfp49VeFodF
 /nr4MhZJv/CRKCKhWntMNWZOvEZQZZASIDtrGHs=
X-Google-Smtp-Source: APXvYqzaY8ICJlDJarIx5dKM0+Gi0Nx3J1tOSWEUB7j1NRB/T0TSrnrOAei+1hdboPzLXnddeDt2dOLislIGnVtHJBg=
X-Received: by 2002:a9d:4d0d:: with SMTP id n13mr19526835otf.191.1555156990347; 
 Sat, 13 Apr 2019 05:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190412100518.24470-1-narmstrong@baylibre.com>
 <20190412100518.24470-4-narmstrong@baylibre.com>
In-Reply-To: <20190412100518.24470-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 13 Apr 2019 14:02:59 +0200
Message-ID: <CAFBinCBo8Z77mDk3Z6WpdKoSemPkopFDd=VvCR7LjsU4LYamfQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12a-u200: enable IR decoder
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_080317_195203_3D64C58A 
X-CRM114-Status: UNSURE (   6.51  )
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
Cc: baylibre-upstreaming@groups.io, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2019 at 12:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add support for the IR decoder input on the U200 Reference Design board.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

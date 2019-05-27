Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91F6C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:33:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 939BA208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SbXnVczI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Qwju68uT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 939BA208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nt7gR2Jl/HtaH+1+o5wJNeBSpRWlHdXxTLYrd0FDVM=; b=SbXnVczI1XVWR5
	U8VQBV759L0TBq/0oYYI02WiZJ8I1YxofmrwrCA/C1wZUdtDMPL5mTv5rMWlOjavH1LXwq/SGnbAz
	UY9LhV2IlcVule1Qb86y+t7AXrb0quzs5mzRpgNEh93/sPbQW/zhGEFq3bK8gUvReX9gpWQ0sF2Bg
	j26vR1WatcMDsDZ+i5zC5+b0yrpK7ywBh/w+I4dJDrq13UGOBAQg1+Q3Ofl7D5Jn26vIal3kbUFr8
	0STPZLGYMoCsjuMx7sYZ6zOyVuFF3wKIAaAkVTi3UqYNhTkVhLMzN2iKdkVUmzp4fNEOBQZb6WfFR
	UjNabeKB4RbiIJLQ/TYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVKQr-0000wg-9o; Mon, 27 May 2019 18:33:13 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVKQp-0000wA-1n; Mon, 27 May 2019 18:33:12 +0000
Received: by mail-oi1-x242.google.com with SMTP id f4so12467618oib.4;
 Mon, 27 May 2019 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S+zfvQdj9FnUsclchCusxb5xJgJGQtK3Vq/yGcWOHbM=;
 b=Qwju68uT26kSUsNGz9ECyX/QmQIUYdN0bXLJQ2iqz9YUkr7O0pMNJQfbARhG4gw6/Q
 KTobXi+lze+W5BZKejwZx08yynKbyloFDgDk/VGCKMER+VEmJ60guYTJb0GHQ7MFCdkf
 x+Rbun65sC8s8UBKooH8StlKmW18EcM1P3ctHRETKl0NLrG2BckZU7cqNCEQAkPGJ5xj
 G+Hxde8BLzqNS+CRaaI6e0DFnfaj7eZZ/PYVxbkhdmKi0Maj7bfVOOtVuOEnZ/Cs/Sey
 AGm7NAle/1CeA16DmFkAtWXxN+c0yxxJN8oeRaUJZq2vksaws9kf+Tuyb3HdJAVJXclz
 EUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S+zfvQdj9FnUsclchCusxb5xJgJGQtK3Vq/yGcWOHbM=;
 b=H6twrkkDLX/HRxBe44orF5GKNVJtYMNzFlmn3IDRfnq/tI3H+yCqxt9309i7wHl/jD
 01cHC73xeH4kp0GAMHkYI3KW+algmoFchCo2u0xu4ueLC3PDIH0BDnELGndde2EWJ6Su
 YG1vSfRmziN/l4u8KTSQk2bOCLwMcoiOUgkNa2SuiYrtZ6dbTpQ4HffXlSsqzlGoaRPN
 uDNfo2BypDeyAcivdgk7XDlDpvLFFDOgWVvxO6hkkNn2SNydzVKwfpVKXWC9AAysMfpw
 sFKy1feTQwcVhENp/BAJJ+2QRB6NQGZf8fNQwY9pILNOL3dM4SItLbqlZQe/Dnb6VOHM
 78XA==
X-Gm-Message-State: APjAAAXVyO9Vf0nxENAlJou3RJ2YbMup7TVutEVOHyzfbwE2w+BkTmb+
 k1QdG3R0OHma8z3DF3DX23lW1wIOKHrsKpiN0dU=
X-Google-Smtp-Source: APXvYqySfT2vqPTVM4SYEzWI5e34ATqeldWvpzGysG2wnPt7WXQGJZSA/rBCSZvvFctmaav3G5VWvp/bJDDNojbX7Oc=
X-Received: by 2002:aca:3545:: with SMTP id c66mr199156oia.129.1558981990179; 
 Mon, 27 May 2019 11:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-2-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:32:59 +0200
Message-ID: <CAFBinCBhdJdHzof0jmy65GHnQi6b8A+tmBUvhZJAf_Nbw1ADvw@mail.gmail.com>
Subject: Re: [PATCH 01/10] arm64: dts: meson-gxm-khadas-vim2: fix
 gpio-keys-polled node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_113311_116914_7972C1E3 
X-CRM114-Status: UNSURE (   8.99  )
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
> Fix DTC warnings:
>
> meson-gxm-khadas-vim2.dtb: Warning (avoid_unnecessary_addr_size):
>    /gpio-keys-polled: unnecessary #address-cells/#size-cells
>         without "ranges" or child "reg" property
>
> Fixes: b8b74dda3908 ("ARM64: dts: meson-gxm: Add support for Khadas VIM2")
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
as well as:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 4 +---
there are more boards with the same "problem" out there
we should clean these up at some point as well


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

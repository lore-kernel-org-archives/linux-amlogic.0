Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F079FC43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jul 2022 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8sjQJWHrNPuo9RCS3ZzJfToSoCDMdZT09IaiYLxKyY=; b=Z4fZEF8xpsQ70d
	n+8yBo3gMwAYkrFXWVxUmmMjhQbGJ43trY1v9rOCP9bKSn1DcAT1xJ9+e2P4+NlzL/Wo8KFsZmAzl
	hoq6oFBzy8iMjQxyReqw9dhFJ0cq4PtwP+Ovgkk3THfSYfGC7/ZyFgVx0ysFPOtFMWVHXNrfpsf4j
	668Ljv9l+rZRUHuGTxwZlxCkMfVbPy0zqiewrCSz9O6h6reKac2wDA6/d+glWciUoOhG2JN2bmtEZ
	hdx1xpf4CFlnZeGYWNC87kG/9vGvSwy27AsXGEaIJsUw9BU7vYEy2ulT8jlddAzkfu8HYbTCAvRxW
	N73MnQAVQAkY9WcmyQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG42P-001414-7C; Mon, 25 Jul 2022 19:46:45 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG42M-0013t1-J8; Mon, 25 Jul 2022 19:46:43 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id f73so21933968yba.10;
        Mon, 25 Jul 2022 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lY+1yfeH/k1eux5Oe0YusyRsTu8qiRzbYPN4fFrCgzE=;
        b=HdiPl6dXjNF6LPf7HkcGS4YZoh5aBgx4nIkbOH/OfLLBBjsKXGqHDIB+hC4jZYE9N/
         GGBmWWQBCnqabbkdrY0Iks11LQ6J2Sg+Cf94dZaXH9hC4WZhZdREtroR/NnZ4n69032q
         mLlTn3GK+cvkdV6aef5Sfa2lcO4ZXTDw8d0rBjOHFDooKliuR5xjmDDeaUc68CN29IbP
         MvSZSRf5rGvvjEj3glkszn0ACaXMepK3ImRRKfVqlvgIgJ0ctR5GG21B1wT9KRPJEBjW
         AdiUsUTDJv8GUcjkLu8ygLRoOQkOtjX6ajKZOywDX4xJVM14aN36sQsaJz6eSFYoJ7f+
         5d3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lY+1yfeH/k1eux5Oe0YusyRsTu8qiRzbYPN4fFrCgzE=;
        b=U+S7JSLnHydbeXdir5VmgaV7p6WIP8cRGAo0StgLBJjouuvZP9JG9uSHUxMp+kczg1
         VxVNC8ryLyyBbtoZcP6GmZeywTEcijIaYD8IMcKrkhoXoiaa7sGmaDpKn9xOElYTzh9k
         caFzRryaeceLR+HdS0V9P6YI89mKI/L/SNdw5OznvprG4bANXZ3/zFZ2tui04PHG6Eba
         fZGV1jg57g4QdlqVi15iH+HP3P1HUS6ZahsgsAt3W58OYB/1xtGJ8kjiGWrRxGeztg2Q
         ko4Q58o9FfHkgtJ4+/37EkzPBE1xWoyEoh5HIQqvl2NrNHmYcnylXFrQhKxwC8UAxMMc
         Eskg==
X-Gm-Message-State: AJIora8IgdQ67om2LMBLfzG96ChvIPHlbh4325O4aoBuFDTJzs5qd5th
	baNoiRrpd7PloZTxeJIPrJleWRcvnWGLw0YMgb0=
X-Google-Smtp-Source: AGRyM1vMUtIDndWYNe5OZY7OOkwWLUzuvCOFcfFBRUrr0Ae03QgWFj/BLZ4lP8rZuLVJji3skuyl0+5BRrNy8T76GiI=
X-Received: by 2002:a25:808c:0:b0:670:7d94:f2a with SMTP id
 n12-20020a25808c000000b006707d940f2amr11093199ybk.452.1658778400804; Mon, 25
 Jul 2022 12:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220705022032.281665-1-windhl@126.com>
In-Reply-To: <20220705022032.281665-1-windhl@126.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 25 Jul 2022 21:46:30 +0200
Message-ID: <CAFBinCC1x-655H2LbbUhiVGmgXL+tdSRnCPV0a-NJcZKOFJZuw@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent()
To: Liang He <windhl@126.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, jbrunet@baylibre.com, 
	inux-amlogic@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_124642_670664_71FAFAD0 
X-CRM114-Status: GOOD (  13.74  )
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

Hello,

thank you for your patch!

On Tue, Jul 5, 2022 at 4:20 AM Liang He <windhl@126.com> wrote:
[...]
> +       struct device_node *np;
>
>         int i, ret;
>
>         match = of_device_get_match_data(&pdev->dev);
> @@ -495,7 +496,9 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
>
>         pwrc->xlate.num_domains = match->count;
>
> -       regmap_hhi = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
> +       np = of_get_parent(pdev->dev.of_node);
> +       regmap_hhi = syscon_node_to_regmap(np);
This works but I had to read the code twice because I thought the
wrong struct device_node was used.
Other drivers typically use "np" for whatever the code section
currently refers to. In this case the code section is about the power
controller, so I thought that "np" was the same as
"pdev->dev.of_node".

I think the code would be easier to understand and the likelihood of
someone making the same mistake as I did if you could rename "np" to
"parent_np" (just like you have done in your other patches).

[...]
> +       struct device_node *np;
same as above, I suggest renaming this to parent_np.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

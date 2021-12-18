Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D963EC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Dec 2021 23:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmU+PjFFSRpmKKtY5FH7ctDB2UuU0vHbtDrvUU6BZ50=; b=1HLZ2PxhlnFxQz
	PjyEzt1ulSWec00e9Y3/PwhGt/RKFN3otlaXg2jEc7i3ZqGQ95aO2f+AvQFoJ8fIcmGxlE5vTbVUL
	9HenjnUjQffS8qqyerS0pGidwzX9/NeP3bD0KoywOlyaGxPt4xYxwR7voO63tVkcjt6TRZOP5G8E9
	FHeS639N+Moju6WO17RFN641CXihPZ1x+tRovD4fvNoeGf/CvDCPjOjJ+3sNusfkVUPWYjbb3jBxx
	8Qu/7tEz2mBAxKfx3U3R6HacDQm+vhdKhnBw1ubfZtBtHE1/ui9LwP8vBsVu3wtXg0RhVddfT4+oa
	bQUhQ15q1k7da9+wFzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myj1X-00EyTC-Lj; Sat, 18 Dec 2021 23:21:55 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myj1L-00EySG-Td; Sat, 18 Dec 2021 23:21:45 +0000
Received: by mail-ed1-x530.google.com with SMTP id z29so22460292edl.7;
 Sat, 18 Dec 2021 15:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/9G+7wKR/KNsA9zGuDF2Yl81AiE4LUMErpemWo7OkFk=;
 b=AHNkg4H4msQ4orc3K6D4Avgakh1S83HT7TZ9yF0AeohMPuj/SrWhyzNdt3GfRnhUXA
 HfNmBkScB4Tl4vdPNsc8BYxntdHfAGLoqThSFG8yPCj8qAJLO31nM1Hkd26iGapqP9MY
 54rRQxCPVqrqxf0XXWY1BV9Pv3193uqnLtUjsG33IyDif8UGq5wVLd8JRY7unCIBCakH
 GVizGaBINMJZ9a3hZiFNrHnMLpTHvfIY9WEux9EcwLLOW4YnsKROOUCbwmevjIlSqueI
 q5RbWWzsRo3q5rtNsHy6clepZRhnzVStjBVjYnLekbsmn7bAkevnrFwR3Z+lD2Veuavb
 /CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/9G+7wKR/KNsA9zGuDF2Yl81AiE4LUMErpemWo7OkFk=;
 b=nt+mbKjB1Vnr4ZNWMPSw2iEWtSe1u2rr4uW6DDJxSbxMOiw+CxuBlZMPt4R5QJwZQq
 zVH39q9xASSF64vK4guJB8/Oyge1TQFszcRKGf4D+yl5/xZriqEjDZ+5Y9uFBVjnSriW
 6lphy8HD+k+DdhBYTA8ZQ6E08f5XKIIaTzD0V92HESopv7+EI1BxZDfW0Sb567foli4n
 XvQNj5HmPYaE7IGUD1IOQghV0/sP7qZcSAHQm+/PmsZonLr7j4o5PQTfS+7NdB9Ucovp
 pOwVNSY5xcWU6aLVV3nmp01Lh+Kc8CrFaHQORJzZ8SevfOc/HjwgzywcwsytrkrLPUzS
 vVtg==
X-Gm-Message-State: AOAM533ZwfwZA7OcWI51wmAL5/L9i9o3e7XCEm1JlHQUc/rcjzGUtM4J
 yCIxFVVU8cmDeb5b3tx95+KhS2zikhyJfiKS3Yg=
X-Google-Smtp-Source: ABdhPJxSa0b2hUzZXFDIQ/DY84rRA9KupwxCFS/7c93jMS/DHOpA5gpCLoW9nuyPgkQkdnsaW+mO5ZYKlF2Lnc+TEUw=
X-Received: by 2002:a17:906:ff14:: with SMTP id
 zn20mr7775536ejb.649.1639869698818; 
 Sat, 18 Dec 2021 15:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20211217202717.10041-1-s.shtylyov@omp.ru>
 <20211217202717.10041-2-s.shtylyov@omp.ru>
In-Reply-To: <20211217202717.10041-2-s.shtylyov@omp.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Dec 2021 00:21:27 +0100
Message-ID: <CAFBinCCSopiPE2o=HXAzxth7o8iXaYqDK_mUcfcZrRbHKK001g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: meson-mx-sdhc: add IRQ check
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_152143_983463_176C2F4D 
X-CRM114-Status: UNSURE (   8.84  )
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

On Fri, Dec 17, 2021 at 9:27 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_threaded_irq()
> (which takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
> an original error code. Stop calling devm_request_threaded_irq() with the
> invalid IRQ #s.
>
> Fixes: e4bf1b0970ef ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for catching this and for submitting a fix!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

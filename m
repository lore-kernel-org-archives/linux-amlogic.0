Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A67C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 07:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4u/uimw4jEE/4BG2YfXP4vn7MWdwh50w7f4d6dNzmLM=; b=2tWKDmUUmbFuaK
	88nL5XNkH+hv1GIURiZEjZg2sDD3KJB9upqHcd2AUQMmIdKxfMlnu8Z8e93E+CaJPkRpKHEhWhFcR
	9C2RCWI672PTDVUHLBScHuE07aJXaYhLZ0FAzgfLBmyjoUFslZfS79iSHbvSCn8c1rseTkIlwQxSS
	WBchUfkaT3OOOCM8Mr4EH0AafNaCyFjj/vcU666SnfhSLmaqnbX8M71hO8Iwpq+ZfcAO1bAEdhnbb
	MdCAVi86gzcCN9uMxBrH1LmMKuexPa4A7i8WGTkRDqHE2jDXsGRpCJFZZb9GILPmniIVftjmZOwVR
	7tM+ZAXoNEhHApkyBdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXER-0000000B7jQ-1Acf;
	Tue, 14 Jul 2026 07:07:07 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXEO-0000000B7iz-2q1E
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 07:07:05 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4955cd5da3dso1656174b6e.2
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jul 2026 00:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784012823; x=1784617623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TuyYrGZ1DyNEfIN58XUvMb0/+UabFx7P6cZQIsqhIhU=;
        b=kE17V2lBCu5A7U3Cij/BwIcDZsVum5Kv+DmkrdEVyxqDBOLplLwXYJ88aPrheCq2V+
         shNxpEFwLDLTCAqtzb52HQ0MQFqFDxprQBV6K5b2Kujmb1znPzpkMQXk4baAgeIj4W2b
         A+xxkNWoCI2gkQHQpG5F0xXaaKqRqtmzopZf8K5CNz/xj0+k2v1zGe528O8uC/MsmTnH
         e0aUDwcdkJ1id3/pk2PDuOt2S+qwHcB/C1jwLQIq2luBgIaG8wmyRLHQ0aMTj8pt5HaD
         qTQ2t4vAJe0U6N+z/XZMa0gMsVedgrLqIbI8/o+b2TvWVpxj1IC/h68iayE6nTf1GUmP
         RrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012823; x=1784617623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuyYrGZ1DyNEfIN58XUvMb0/+UabFx7P6cZQIsqhIhU=;
        b=FmIg1EBRurloF4joo1wcQYSL+hPRYPF8xPqhpBE+bsTE4qYc3TuLVwuhJ6HVl2UyqH
         LxkqkMVJTgJAvExNHwOnl+9ykZMmE112TJf/2zI8oXcWx/tDwWoAJ2zE/RzrV0JEbWav
         eaKgkg0z78FXPAunpV1NvkG2v5jI8EdyG65OC0mV4XS1lny7NFzX1ZtyXcBfIVEeWwK7
         5PGn8fjhCAwBgzSwGiqwvmbR/T4ZJdpGRjiJkAyPMj+hHGlY8pWQdWcTMzSiBC+STNDl
         fQcKmNUt/OZTA/GkRM+woUl3Phkc+zX0Qh01Cq3zLIfAH0BBhJxE2hQbY8vsrTAclofj
         n0Hg==
X-Forwarded-Encrypted: i=1; AFNElJ8R3xYO/DhdEp3kB8Mt0S0egek7wSym/YGg1mIhZUfbt4TmjVCvIWXPk5h3TMHYnFMFz48icgGIvXEXtGXB@lists.infradead.org
X-Gm-Message-State: AOJu0YwvNqTYxWh5g2A+oeCoaRTTLGN6w/LRUIqbzNUuoPGOZk9rx+6D
	RttXvk1qUlcY6cAsfAliM+kL3lN7hSG2m8C/aduH/a9JsEQMOGeCQKl4
X-Gm-Gg: AfdE7clfqvZ/MMubuxly78vatHxOxVatkwpxX1/DToDawAd67g3uyXX3C8kUUxAq+Dx
	nxNYphfQo7FhqX3srNp6m0rs8fY+sFN4oy9r7iwxfi4YA9oTy34r1SdqJY/9gZUqvfR/AXOnp+4
	FAMieVXoXKz8CLRSFP4yO46zsRMG5Sx8H7oxyfUGyE789H6VuxMsDXnWmecHmFsRMnpcKJM8q66
	JrwHwxb1GwY9dVpVhYB1uKYPtmC7Pl3gl+erv+n1GlDXM0zrvuDJhG+6S1wwFqzp1dC+C+JNFRn
	W0lcw01NTcV7pH41vbZ9Gi7BhszOIhX3VfMw32HbHRXyTyOL5fZH0qCrYmCdlS10nke6hf3i96X
	+jrYwmpxr+H6WkbdJHpN6qDL/iRBMHw+JPlQw22W9ELXVgHnfFtIEA0Fl6zfndpQHIHUUiaFM6z
	6rk31R
X-Received: by 2002:a05:6808:319b:b0:4a4:25b4:a0be with SMTP id 5614622812f47-4a42abc0379mr7380084b6e.2.1784012823154;
        Tue, 14 Jul 2026 00:07:03 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1ad5a77e3sm13498322b6e.6.2026.07.14.00.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:07:01 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:06:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alXgD1Vr1zAiVf4B@stanley.mountain>
References: <20260713171644.691-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713171644.691-1-alfievarghese22@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_000704_716619_E7D0FDAF 
X-CRM114-Status: UNSURE (   7.59  )
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

On Mon, Jul 13, 2026 at 10:46:44PM +0530, Alfie Varghese wrote:
> vdec_probe() maps any devm_clk_get() failure to -EPROBE_DEFER. This is
> incorrect because devm_clk_get() can fail with other error codes like
> -ENOMEM or -ENOENT (clock not registered). Hardcoding -EPROBE_DEFER
> masks these real errors, causing the driver core to retry probing
> indefinitely instead of failing early.

It will not keep retrying "indefinitely".  -EPROBE_DEFER handling
is smarter than that.  Fix the misleading commit message and add
a Fixes tag.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

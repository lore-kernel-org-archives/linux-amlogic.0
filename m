Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAF9C2A09B
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Aug 2026 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rWfRhsiu6+cx9R27jR+CY7NhKLNjOe7ugApU7wHnWY=; b=sUjmpY/7ERHT9C
	w5wVqe5De6IarhQUvaRG1UyWjOk338W+NbKdo+MZr+ScPmO93ZM9T1h7iWVKEGrobmo45mADIwXii
	N4xP1+6XDl/bLIklHCcjlGHqAc3CCgiorCwpzXC5Ec0zbrmp1eCHw/apej73pP2p0LpjvaA590/bg
	jEOb7emiwy1VUVza6dOOVguJtCBiz6L2AgUkVf/5Y2hVQtnSIGGlFKd4rRBGuCpRWzFHoJ4wKTR6D
	m23Rl2BRhTYMsNIJKoomL6HMDKRAtnDj+Y92fVh5P2b6O5H/47boj4ZfIZ+AUluTBwQgeQda4SerK
	BmAciD6mSKLlgIUNGhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPrN-00000008eEP-0Ffx;
	Fri, 07 Aug 2026 19:04:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPrK-00000008eE1-1rtP
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Aug 2026 19:03:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4980dc26022so37219725e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Aug 2026 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786129436; x=1786734236; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nGYkSjeNWzIR+oSaWrAbeTSuJ9ncx1pTuouXS25C6zQ=;
        b=Pk1uZWqsT3ipy5oPQ8rNkg53rJhFGBZsVmggojnrjdtuheN4lK6xQMRbE03uSEvx0/
         G5c9DdQekYRoU+qYyHjpN5uMxia+GYH3GNO2Ga/Tog6t69nD/G24HrC1cw+deb0U1Al1
         /EUqZKfcZeD2Qx3nud8n7ME2pG35lOK3IFQ650KHx+XEEmEdIlZMsQZFyacKAiLV6sth
         kWYZdjb6jVkJJsYHd3/rvLAdWM3gMpVhPiibNoe+gA2Ve5uUJu3BgwnAnYrCz19VWovA
         HTt1/Jksq5IST1JbqkwekaIfSnD8TuAvO0d+0z/JqPWTxTatGWnplN/tcRwoVd30CTIZ
         Y43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786129436; x=1786734236;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGYkSjeNWzIR+oSaWrAbeTSuJ9ncx1pTuouXS25C6zQ=;
        b=EkM3Tg98cxLJ4tCjfJAPAfU4HSkYOZhVtJMRLdwWg2KPL8KRoKPnxZ5vG8diPbY1Wt
         GG/gb0BSiPhnP+QksDzY4rmw6oTxYlvmx3YO4EJNoV91SpVJvPs9P5B1UzooM9ylsnIT
         4SKHDNDi3UcSrltBR0YUP18pDz/QKqBO2U9pFWAnptcCIg1GV6AETVCYVLJYv3JRXVUd
         JP+gLuXaX5ko+9EVsDtVYzxBMJ07L+xzz8OoIsDaBHtR0s2malC3cSErjCzV5piriT3N
         Qy1KI20fo6ZqbVBfKD+gqFGQwIUeUZiq7s7G/OL4/WcVfDPNbenxjcL/ym410fa27scV
         GplA==
X-Gm-Message-State: AOJu0YzBL6kGe8wYPbvAu3l+98UFpT/tMXCqkqTZ4aWiF1xaFgSoQU1B
	wpwbW9+Jo0YereaMVd9wuoIZu6HAsveB+1Q/A7O/hMooJJfNJwHpA2mXveEJqZb/
X-Gm-Gg: AR+sD13sAds8KBgw0Y/h20shUGftjtQc7Nz2ySCS1oy3x9HZN+PH9/4ALZMCfMw7U95
	OTuNZJ31gC9Znk/6iTp9dakFQFx4v7y+8icObYHzctSyxeW/CGkoQ671ju1+1JKN7to+DQlcI5e
	rzu6BUoKSUFrOycXMExYN5Oqgh1kZIS9+zTqjbiwO7JZQztIfmrQNtky8/Q7tx9R4GYvgN7bx1Y
	NzLlrKBDG7vW4RMPCs7L8rBLz5oUFZe/GQ/dKt4Wkdekb50EuaIwedWtre9fx2e/qh/Eg25hJaw
	er6ULamEb5AAz0dPywKdi8DCXZgL065HhEpB4MDyEFu96LG028ZWi3yZUhfm79q3flFe6/2v2j+
	f2kwItqzJAe+UozZXC6/DNk7nGiBsS/YDujlWD28zuymZjKAZUSKabx4nuCPTaFqcyXZOjfu2IE
	dgDR0VfnhJtEA5r5QSuSZnN1/9A+D+W9xqbQExnt6vsQUJsYzn4JOVYraO51Jayi4OD+IfSsD7G
	yjc9eaUtafLiF1fW+dMkxs2kxW/E1A=
X-Received: by 2002:a05:600c:1f8c:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4994e7a820dmr309053225e9.7.1786129435911;
        Fri, 07 Aug 2026 12:03:55 -0700 (PDT)
Received: from smtpclient.apple ([94.156.253.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a404sm175883695e9.9.2026.08.07.12.03.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Aug 2026 12:03:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: GXL/S905X HDMI: 1440x900 DMT mode fails to display despite clean
 modeset (meson_drm)
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAK3gv+eeCs+9ipTkoGzd0eopEax6pvM02wvgCwyr-LRjNSL14w@mail.gmail.com>
Date: Fri, 7 Aug 2026 23:03:43 +0400
Cc: linux-amlogic@lists.infradead.org
Message-Id: <63BB2941-7F44-4F0C-99DA-D86B932C0970@gmail.com>
References: <CAK3gv+eeCs+9ipTkoGzd0eopEax6pvM02wvgCwyr-LRjNSL14w@mail.gmail.com>
To: Steve_vr <sstevevr@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_120358_486519_9FB91928 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBPbiA3IEF1ZyAyMDI2LCBhdCA5OjQz4oCvcG0sIFN0ZXZlX3ZyIDxzc3RldmV2ckBnbWFpbC5j
b20+IHdyb3RlOgo+IAo+IEhpIGFsbCwKCltzbmlwXQoKPiBIYXBweSB0byB0ZXN0IHBhdGNoZXMg
b3IgcHJvdmlkZSBtb3JlIGRtZXNnL2VkaWQtZGVjb2RlIG91dHB1dCBpZgo+IHVzZWZ1bC4gRnVs
bCB0ZWNobmljYWwgd3JpdGV1cCAobW9kZSBzdHJpbmdzIHRyaWVkLCBkbWVzZyBleGNlcnB0cywK
PiBQSFkgcmVnaXN0ZXIgdmFsdWVzKSBhdmFpbGFibGUgb24gcmVxdWVzdC4KCkZpcnN0IHRoaW5n
IHRvIGRvIGlzIHByb3ZlIHRoZSBpc3N1ZSBleGlzdHMgb24gYSBjdXJyZW50IG1haW5saW5lCmtl
cm5lbCBhbmQgbm90IHRoZSBkb3duc3RyZWFtIHBhdGNoaWVzdCB5b3UgYXJlIHVzaW5nLiBUaGVy
ZSBhcmUKY2hhbmdlcyBpbiByZWNlbnQgKG5ld2VyKSBrZXJuZWxzIHRoYXQgbWF5IHJlc29sdmUg
dGhlIGlzc3VlLgoKQ0guCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK

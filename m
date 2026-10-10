Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B46DCA9ECA
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zs0WQQ8PV6aFH0H3OLkLPmtNyxBKqfJyqa90GLt56Ns=; b=dhri8ZRurCXKmx
	1kz51IxbwY5qTRUD+/2WcmVriTGm13fUNQE+8t+E3Qt0BXn9TbX2HQ/g+zvlj80vj9VoMwnfxTQ8p
	HC/9ILJx5zkn6CXSzcgAtguivbXAz/RbTGpRXMNDBN3xmmF1tyvFxanHTVcRHe7v5Yvv8ID+Zeqrd
	PXjXB7WFPuildhX/B+Qt0unjcxrFtm8sSU+dwZ/a6mNsFy57QrjRt7vKVfS57bJX8oRzGTgK+p03L
	EGVxNAjC+kHhbcMpTgv0KFOHaDbGL6pzeCJEQs3kANAnpXjgSKBHsMES8t4u1F/9hGzvx6u1AREE+
	Tku8RteNAZZcnjR2+r7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFf7n-00000008TdO-0cS6;
	Sat, 10 Oct 2026 22:01:03 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFf7c-00000008Taq-2AC2
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 22:00:56 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-677dbe051d4so647120d50.0
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 15:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669651; cv=none;
        d=google.com; s=arc-20260327;
        b=Qi3IS9dH5ZbE71ux+o76WU2Gr8Fdpf6S7UD6tXzlkGsVzqhNCHLO9UEFtPv0mdi2dN
         OvPRQNd147eGY7+mvlD1fyXsTBauVcVg5opbCMfb08nhKAoHC9LkISXUvGACxHC1JDLK
         aDp5TuSLw5u6OiWEh6n+S9Fb5FyTL48lZxuIGnzkA4UGa4Zy+/ly9DErpXT3QTjR4iYY
         WDzoZoN+JMwhX4ACB4t2HxgrdF+kvKXLtFkUUObmtQ/z6QCgvADq37XfZP+v8rY7R5i4
         XqwpR9KyStftqXmBHbiwDVEzUpJ2Bx+SVWN/Tm3mtJxh5cOveJY5pH54/7GOit3VMSGL
         tFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        fh=bd4WlQfXenfHsCaXl5/WwCoajiOka0ggWzwf8yAXOxo=;
        b=UOUGCa5OLnUZYzOWsh24mLZ2moy1ZATBDLuRc7huLQ1rZva2HK9LaJ0eIYHVaFwWgk
         5XMmBCEpL3CNWjomujPLDAYhsxRmJqWI+/JmDOU4B2KnooDkSxKUPM0HBZZKvKHWsPc3
         86apqypu9ui4Dgt3l4dTZ+dKNhnDwwOFoGI2eKUCsGdYvBumFikZNAYAsjqVnTCB8A/v
         vKdjlHcJRiiJb7goGO0sF1VBPaqujyoQiHlevkh+msgRIIHHa7SS3liJW4tBOKzNNGNP
         CmaHvPruS+W2JKlGhiZuNjeG0kD9Qpe9EjCH5gdXKvQJ7yzkom0Tkp2TpXFtMIsyPhKK
         YPBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791669651; x=1792274451; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        b=FsDSYp8FetzNstVVzl2A22uCXDTZ2/T+WGFSppD3pvDKyQAiNkjSSFifchJlGAo0oL
         f6M7mC0WfxbA05avM8LO3faF78Kl3PuXuUMiBkvpNgru8swEYQntsJRVTb9p2sUkTl1c
         y+xPjiNjtSMVN/PCLNVnroirj4RjYzgiVRvAJPhmsUdToYxZ3lldfb5/Jf7FpUMGEWSz
         8x3rk+yCsK6BBbBJQaG+dGqXucQIYwDH+SRqTV2OjyII1dDOspxA9Vm++/Txa4XmrO78
         wLJspWgNH2WYbuxCwkeLFVW8BVLYVAqOUYbhiwJOnFxnMSkiEQN4DD8u++XzriIAuM6V
         ROEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669651; x=1792274451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        b=CDv+wR7PtkZkf+lRLDRQDsM/U6sti3XBKYJQmbIKZeJDjZoADZ6D/s7rOnnfuyd2RN
         7sGp+6lZSwv3QxCX9kJTkZpTmorNdO4ODpj+M8L03OxMaSqVb65BR3SN8sT0p4k2Tp1H
         uBmM+dXYWw5vbeVM7RXVqYREIP7rWYG7ayg9HX90F9xTvDedcN1LLdqQ7Jx5gPMxKxSD
         HoobIn2riu9j4tGkhKLSlZxi1Pn/3sXr3XHndQ3LWZa05DYUdyN0M1BLvgIOLinCvDj1
         AZB5EGci3gd2U3znUbVfxYIxfjA8ertGpO3AUGKmv7z/pISW/I79L7zRKTdJkE/1QQUN
         xODQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8A9Kn0w91S09tgAMy0b5i/XSAap7cJ/bYtvc7k4/jT4IDxe1+SvcHWcNDymmfrSwQWqOdwHxZHrE4bPI5@lists.infradead.org
X-Gm-Message-State: AFq9FYJINwtL54/lYuCvzibYvjMpRgCLW9uAegXPeUwpBQync7+Wbmhc
	TFXyzf/gH9UQUSAOFMG2ujaOhBgb2xEqRG791PMZbQZ4Kvpl1S1P0e0C74QVNB4ksi4upb2NWix
	6LGXZodkssyvh0UKEUltrzxhqKCC8Ff8=
X-Gm-Gg: AYBFou0nrzghCofCaCe1Xq/oUf8X2a0IhvR22H9YuJu9BSNaS8Lg2lBq3M52uh2TpEQ
	CfeM/Husd2/oQC7nj3HU7zGFn8faqlBO9/4t6M0iV0hYiqIZ23OgUi4GHs/eA2sM4HXGrExFU2y
	6F542fCsQ8L4xEVbZKJfVBR0YFJoGGvp08M8uVtim28KXgMF5HhPvOOk+rzthQyBIo7XaFDn4s5
	UvPJB3Hmh93eALG2gUuC0LGm3QNx4xQFodVMsCaOMqGf5axwWwzgx6u/wRf8cfhKPuPe/OF0GqR
	qTeM0G5RIlJgS+P6xdwUBCxqpgQIcwIbZYVE8XxTzF4gRhboO/u5ru7XE89ByK7vO0pmQN3sc10
	WLO63vs8vtaOs
X-Received: by 2002:a05:690e:810:20b0:671:5206:72f2 with SMTP id
 956f58d0204a3-67936049a53mr1141845d50.56.1791669651100; Sat, 10 Oct 2026
 15:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-8-tanure@linux.com>
In-Reply-To: <20261010105900.247342-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:00:40 +0200
X-Gm-Features: AclHuK-1AFCBBfJ7Kfb5Ikey6DbHIu9yDPTfwBVIgnuMS2JnhjeqsjRPSCAltBs
Message-ID: <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_150054_342554_2ED2C185 
X-CRM114-Status: GOOD (  10.48  )
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

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTI6NTnigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBs
aW51eC5jb20+IHdyb3RlOgpbLi4uXQo+IFJHTUlJIG5lZWRzIGEgZGVsYXkgb24gZWFjaCBvZiBp
dHMgdHdvIGNsb2NrcywgYW5kIG9uIHRoaXMgYm9hcmQKPiBib3RoIGNvbWUgZnJvbSBpbnNpZGUg
dGhlIGNoaXBzLCBub3QgZnJvbSB0aGUgYm9hcmQgdHJhY2VzLiBUaGUgUEhZCj4gYWRkcyB0aGUg
b25lIG9uIHJlY2VpdmUuIEl0cyB0cmFuc21pdCBkZWxheSBkb2VzIG5vdCB3b3JrIGhlcmUsIHNv
IHRoZQo+IGNvbnRyb2xsZXIgYWRkcyB0aGF0IG9uZS4KWy4uLl0KPiArJmV0aG1hYyB7Cj4gKyAg
ICAgICBzdGF0dXMgPSAib2theSI7Cj4gKyAgICAgICBwaW5jdHJsLTAgPSA8JmV0aF9waW5zPiwg
PCZldGhfcmdtaWlfcGlucz47Cj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+
ICsgICAgICAgcGh5LW1vZGUgPSAicmdtaWktaWQiOwo+ICsgICAgICAgcGh5LWhhbmRsZSA9IDwm
ZXh0ZXJuYWxfcGh5PjsKPiArICAgICAgIHR4LWludGVybmFsLWRlbGF5LXBzID0gPDIwMDA+OwpZ
b3UncmUgc3RhdGluZyB0aGF0IFJUTDgyMTFGJ3MgVFggZGVsYXkgZG9lc24ndCB3b3JrIGJ1dCBu
b3QgZXhwbGFpbmluZyB3aHkuCkkgaGF2ZW4ndCBjb21lIGFjcm9zcyB0aGlzIGJlaGF2aW9yIGJl
Zm9yZSBhbmQgSSdtIHdvcnJpZWQgdGhhdCB0aGF0J3MKYW4gaXNzdWUgd2l0aCBhIGJhdGNoIG9m
IFJUTDgyMTFGLgpXaGF0IGlmIHRoZSBwcmV2aW91cy9uZXh0IGJhdGNoIG9mIFJUTDgyMTFGIHdp
bGwgaGF2ZSB3b3JraW5nIFRYIGRlbGF5CmFnYWluIC0gd291bGRuJ3QgdGhhdCBtZWFuIDRucyBk
ZWxheSBpbiB0b3RhbCB1bmxlc3MgdGhlIFJUTDgyMTFGCmRyaXZlciBpcyBjaGFuZ2VkPwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

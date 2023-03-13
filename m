Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B5DC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jO3zY3fScz4PzLGzzowVXKPU1EKTiRLJ9PabdYKOlOE=; b=D5Cp5tzhalW5/H
	3sD0I69EXHd3Nu2aB9TcfFz298D4Cb5RN2BViMct+vshffJeVKiwczO9P+zc5Q0ArI3umi5VMp9qa
	oM1fgFMoZ+YLbxrqO7bvwtMizC+jC3rVsUScl1LmBa5yorZtN3aa4CjgsMrslqpHWMhIOya1Z4ops
	Qcs4blJQFovp04/5GBox3UYdSntY+nGJhXGjuLmHkr9h9T5C5i4/QPcaKtTjs2wgRgNIH/KtkXDd1
	MGAwIeVpna3yDmlk90nEpVvpxiVVnVr4dZpWTMhhPnKflg/G26R/stVyUbpJCTCvd5fnGF+Q+IXpR
	Fo/iBP/ItqPx4YuUTj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboPI-007bRx-3t; Mon, 13 Mar 2023 20:04:32 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboPF-007bQQ-Mi
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 20:04:31 +0000
Received: by mail-ed1-x52b.google.com with SMTP id da10so53575659edb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Mar 2023 13:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678737865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlsJMKW6fTnSyJwAJ4cqmlm3nWjmDE6jeDNees0hYCg=;
        b=n9+PUEiEa5PYrJ1/BoBZUrn8uJ9PX4FHL1ZcarM/14nWpoDvRkiHFPoCI7GYf11d/k
         XMKEWzewKzarPdpkk6l803LIGdy6l9fifXm4mhMfBYaRG36g1qUyg6fqa+kS8fxnhLLM
         3FV+2tbxvJwh0qY/BhfNaw0aL/+c0KYw4kzbQbzJEqOX7Tw7A8iQtWdOmL6a9lqE2oCY
         LL2hszEQ5X27jJVE9gqI8EiHzNQurEoiynjojgSUNd2VXO6wCANAVXnykRzzRLgob+M9
         32rMPxuPP9zqKh+LjmwiKhQxxdM48rHJIGJxD7tSx5Hkxd2NRAysKo2rmRm/R0lrq/hC
         xxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678737865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlsJMKW6fTnSyJwAJ4cqmlm3nWjmDE6jeDNees0hYCg=;
        b=2fV0sAMipdeUv43CblszrlEfuYFvqwV/WSwYlYeAjXxDM2GtRYtZo9CKq1dh8012sn
         rbSsddKe8t/VkhOArMigcXPyEHg9RTyqUAsVFNtKNncyg98GFVuVDDkwwJ3pi6dbopRy
         hArsCY1VUMeyjUePfa+pSpS0Jq/K6Nqh+h8Xi2gVHxE3ntv6shWQKJZHeMTpuuw/pbNS
         lSJ0uhYB6R+/UNcqQnLlu7t8etnKyrq6YFwrlP3TtjXTOX8XRvY4fQf5+9VYtvBgdKv7
         +QI1ChDG8c/FD5G5l7NpdOc/e+OwliaJp8Wo0AluROPXqso1kNprHaim4zIWTjAnY/vm
         2AYw==
X-Gm-Message-State: AO0yUKW+H9zy/V8ifnJH6YqsG0DTnu0/9KKOSXmcTVpddGTtWn4mRCn8
	JZFnzNr8sbJCeyRjJ1PRbLx71+rIVYpj0BLLBQQ=
X-Google-Smtp-Source: AK7set/oCOy3yOookh9Pv+mYKU9tKB4xqe73VFecMHnsR39xC93Ftkqk+U7IUkmAnouQMWc1/qsU77Gsu/G15zFYjJA=
X-Received: by 2002:a17:906:6083:b0:919:2e39:95e5 with SMTP id
 t3-20020a170906608300b009192e3995e5mr9803205ejj.6.1678737865203; Mon, 13 Mar
 2023 13:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr> <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr> <13676dcc-944f-cf3d-8adf-ee3d4e8fa699@free.fr>
 <e5baf73b-3b9d-1011-2ed9-4b6fc7ee644f@free.fr> <CAPDyKFoAT-jMkYb7=m--q_eEb2xxH-VPQy5vaHNvw4s=WiAeCg@mail.gmail.com>
 <0450e34e-7190-104c-832a-150f15f7c825@free.fr> <3d91a067-c9c3-6d71-11a7-1289ea67f109@free.fr>
 <eecb86be-81e3-09cd-8ec7-4e77c42f2795@free.fr>
In-Reply-To: <eecb86be-81e3-09cd-8ec7-4e77c42f2795@free.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 13 Mar 2023 21:04:14 +0100
Message-ID: <CAFBinCDHRhLSyFsEv7cdhSgZorj-TdR3HhqSBnAQcUtEsecV=Q@mail.gmail.com>
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, 
	Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, Alexander Prutskov <alep@cypress.com>, 
	Joseph chuang <jiac@cypress.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Angus Ainslie <angus@akkea.ca>, Pierre-Hugues Husson <phh@phh.me>, 
	linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_130429_784803_EE0A69DB 
X-CRM114-Status: GOOD (  16.82  )
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

SGkgTWFyYywKCk9uIE1vbiwgTWFyIDEzLCAyMDIzIGF0IDY6MDnigK9QTSBNYXJjIEdvbnphbGV6
IDxtYXJjLncuZ29uemFsZXpAZnJlZS5mcj4gd3JvdGU6ClsuLi5dCj4gPiBXcmFwcGluZyBtbWNf
c2VuZF9pb19vcF9jb25kKCkgaW4gYSBsb29wCj4gPiBtYWtlcyBpdCB3b3JrIG9uIHRoZSBzZWNv
bmQgdHJ5Lgo+Cj4gQWxtb3N0IHRoZXJlLCBJIHRoaW5rLCBJIGhvcGUgOikKPgo+IERUIHByb3Ag
InBvc3QtcG93ZXItb24tZGVsYXktbXMiIGxvb2tzIGxpa2Ugd2hhdCBJIG5lZWRlZCBhbGwgYWxv
bmcuCj4gSXQgZXhpc3RzIGJvdGggZm9yIGhvc3QgKGRlZmF1bHQgMTAgbXMpIGFuZCBmb3IgcHdy
c2VxX3NpbXBsZSAoZGVmYXVsdCAwIGFwcGFyZW50bHkpLgpJIHRoaW5rIHlvdSdyZSBvbiB0aGUg
cmlnaHQgdHJhY2sgaGVyZSEKClsuLi5dCj4gUVVFU1RJT046Cj4gSXQncyBub3QgY2xlYXIgdG8g
bWUgd2h5IHdlIHNsZWVwIHR3aWNlIGZvciBob3N0LT5pb3MucG93ZXJfZGVsYXlfbXM/CkknbSBu
b3Qgc3VyZSBidXQgSSB0aGluayBob3N0LT5pb3MucG93ZXJfZGVsYXlfbXMgaXMgaW5kZXBlbmRl
bnQgZnJvbQp0aGUgcG9zdC1wb3dlci1vbi1kZWxheS1tcyBwcm9wZXJ0eSBvZiAibW1jLXB3cnNl
cS1zaW1wbGUiLgoKPiBMb29rcyBsaWtlIGFsbCBJIG5lZWQgaXMgdG8gYWRkIHBvc3QtcG93ZXIt
b24tZGVsYXktbXMgPSA8MTAwPjsgdG8KPgo+ICAgICAgICAgc2Rpb19wd3JzZXE6IHNkaW8tcHdy
c2VxIHsKPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtbWMtcHdyc2VxLXNpbXBsZSI7
Cj4gICAgICAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZncGlvIEdQSU9YXzYgR1BJT19BQ1RJ
VkVfTE9XPjsKPiAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZ3aWZpMzJrPjsKPiAgICAgICAg
ICAgICAgICAgY2xvY2stbmFtZXMgPSAiZXh0X2Nsb2NrIjsKPiAgICAgICAgIH07CkkgZm91bmQg
dGhlIGZvbGxvd2luZyBjb2RlIGluIHRoZSB2ZW5kb3IgUlRMODgyMkNTIGRyaXZlciBbMF0uClNp
bXBsaWZpZWQgdmVyc2lvbjoKICAgIGZvciAoaSA9IDA7IGkgPD0gNTA7IGkrKykgewogICAgICAg
bXNsZWVwKDEwKTsKICAgICAgICBpZiAoc2RoY2lfZGV2aWNlX2F0dGFjaGVkKCkpCiAgICAgICAg
ICAgYnJlYWs7CiAgIH0KKHNvIGEgZGVsYXkgb2YgdXAgdG8gNTAwbXMpCgpBbHNvIEkgZm91bmQg
dGhpcyBjb2RlIFsxXSBpbiB0aGUgc2FtZSByZXBvOgogICAgbW1jX3BtX2dwaW9fY3RybCgicnRs
ODE4OWVzX3ZkZF9lbiIsIDEpOwogICAgdWRlbGF5KDEwMCk7CiAgICBtbWNfcG1fZ3Bpb19jdHJs
KCJydGw4MTg5ZXNfdmNjX2VuIiwgMSk7CiAgICB1ZGVsYXkoNTApOwoKU28gbGlrZSBJIHNhaWQg
YWJvdmU6IEkgdGhpbmsgeW91J3JlIGdvaW5nIGluIHRoZSByaWdodCBkaXJlY3Rpb24hCgoKQmVz
dCByZWdhcmRzLApNYXJ0aW4KCgpbMF0gaHR0cHM6Ly9naXRodWIuY29tL2NoZXdpdHQvUlRMODgy
MkNTL2Jsb2IvbWFpbi9wbGF0Zm9ybS9wbGF0Zm9ybV9zcHJkX3NkaW8uYyNMNTUtTDYyClsxXSBo
dHRwczovL2dpdGh1Yi5jb20vY2hld2l0dC9SVEw4ODIyQ1MvYmxvYi9tYWluL3BsYXRmb3JtL3Bs
YXRmb3JtX0FSTV9TVU54SV9zZGlvLmMjTDM1LUw0MwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

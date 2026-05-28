Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646D5CD5BD5
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 May 2026 19:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRQ0RpwwOF0huSA3fKcM/M/+IO4xqfC2lDwS10TMs4Y=; b=VfZ4yNjx7EMK0h
	AaXzqmX3fMEK1uytghLQMoA/xTpv8B1yU9idTQZ69GNSHGIjp+YZeCsaQRY/P9xj/WV/WNOH82nxP
	bI3mR5D5mabAVdZF/jPRCWgNxNrp8e+DLAkDfAfOUCY2KhKQBsv3bfB/NvG8rqKzeXzYafTxX7uzs
	m0VFViuWrtm6Q23QM5caOsJQWqF8Z8X83V8oa8ytgIKRBT6XWxh0kl3vSORZJxuDTMOnpXbJI8fr3
	Zws6Gig9dRIi+uGTbEXX5ooSNW8119lP+vsxrZARuZ1wd1+qsqS2wUSENuwOCFai1f3Wabp232RE6
	3W+SGUIEE9qfNSbDswsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSgef-00000006IGD-0SHU;
	Thu, 28 May 2026 19:44:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSgeb-00000006IEs-2e9S
	for linux-amlogic@lists.infradead.org;
	Thu, 28 May 2026 19:44:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so605ad.0
        for <linux-amlogic@lists.infradead.org>; Thu, 28 May 2026 12:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779997468; cv=none;
        d=google.com; s=arc-20240605;
        b=V7UgpsnjfCSYPcaRWUjT7jGu3ZPKskKACMtUnLRcZdmIYrZn1Z8F2xP+9Y6Ubsozhf
         3janjda5/+xX7DXpZ88y2dh5nmNgS+u2d+K/gssQkwupJ4XOV+zKZOJataOA4upTidY9
         IiOTTMtEv2Hun9LMHDVBxfYKGowCfZyquyyon2TZRIkBIV5QXmX5s1NRSu+sHfS1Br/u
         Eoy/PAJDCYikwkGeG4ycg2Ps8iS5Yhn1jyo+lbvRvjnLbrrAsUPbjMWgbkopBdXdw9NA
         P3NhkxqYDCBeu+YT5yRZDm+QLaGAaxnQwOqFjI4G3Q33eMuFc+NTEgN06rLXGqpxTQLV
         2Svg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IynHu/DX5NF0G96SeXwK1qnUut5hZzt9g6fKpDU65E=;
        fh=U83BtgfZ2xWOsSmFhXz4Gsqh3NdcXJHMPGApErG0UNQ=;
        b=A8qmGl09rZZtvhaMyPPuZVpnYFmGGAQM6ZOY8pGzncwFWR2FDiKxVw41R0B2z3lNU9
         0W7QuH+aYD8mUePONaii8RCkMrw+EmevxhJwJIxUpr5cs1zxESeP1mZcaj//gslIa4fr
         8zk6vW4BNsOrJXwokTn3jwabKIyik6xn2UgyLCUCZg+5hdO8EcisrR7RzAfvAaewg5Zn
         8Gvb09eZsrf8xk7tL0MrgcLVKBUaE5lmwSGQjm5P3P2qZ2cc1nI+6x+nYUNsJdXTHbLK
         CQYUOj3Q8Mq8kmYXo9f62smr69NFk3Vos2EAxKs+mqLjPnIPXyeSlBne3iCp6jsy6iIl
         m3SA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779997468; x=1780602268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IynHu/DX5NF0G96SeXwK1qnUut5hZzt9g6fKpDU65E=;
        b=tVVpDw23UeOaBfzhcTg1w+fvXJHSiKUtJSUBpuksAI7qFes67OLUFEd1219KqH3Jua
         YqDLlKSyTV8r3JJVGJV/vZIqwmP1pNAYB4rinpiO+Z/E6dJY6xWD92raKOfBEQXnStAh
         jOO3x7Ufxj5Cg3/RO4PyKF9PQI5+nUFwLeBTODe2IMBNk63BbevIXEsK/SuQXzAFIFxK
         4YQZvtx37nenVbi50uoVZpoEjhTEFEVZcNd+NEvcq2JXgHEQ3Ex7egI+s+JUvfTYbg9w
         7txbQ7+HQRArVCYkB5rkh7ZaSWirCpo2leVCu2aRIE7NxQEWofmMMOX5H0Nc1MUB53hx
         AiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779997468; x=1780602268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8IynHu/DX5NF0G96SeXwK1qnUut5hZzt9g6fKpDU65E=;
        b=Ww/lrBcJ0t5t5bqLTlVXPE674PhahCoPLi/t9hN2EClIIVTykr7BZ57dQ/kYsMNXjf
         beNJUr8rIhKq/dRnSaTGg5cK44DYWlioawffwyB9i3f91qgTY3thpaaUzZwcLG8wguDT
         QgahgliFK2BSFxEZ22tVWwTXViF1HfeSl/eyPxTKlB+DgiSjy8xQvJJggoinYzQL9aqP
         eHMnjc+gVRqiQu2MWdWdWZNrKi8ApSdAOZoy23LgUxjr2zFmNYLdxDWNAcHV8+ggjPbX
         AZQaCOQkQ/YRHs8qB1zx/9SkQcsR49E4i2D6jM4J8EEehb462Z5oaeDlnB/0sN+aQ+Jr
         wGrg==
X-Forwarded-Encrypted: i=1; AFNElJ+C4mVNCn22nP16c0K6oF1AEFKbooNAgGnEsZaXx2QIzh4D5FgzoAQTG3SW1epD59oH/ZoLcaW8Dh8t+x62@lists.infradead.org
X-Gm-Message-State: AOJu0Yw89KlbYQC0GgSjpdv1MAVohznCtGRl8ThVpzO9KCoHQoFOAvl9
	naDOqEkdAb5jK3RWJlUpRG9OYVTHzV1AJTEOwF+hXXG/P6d14vDSM6HqbBJCIsAFWkQRe2meu1B
	IvJE3+/OZENVB93ceDjA/KdOu/w7qDBZiprm8SHdp
X-Gm-Gg: Acq92OHr5wDmlUQQUjYiGR1pU2S3zoSBxnXnrsyeMetThwv6eQ5xWdItPljjEHCBlix
	nCCo1xNVmLR/dKaWegkwf+itaMd1BDV3u7J83zZURIo66ZGGGBZkEtwA0Z95cWLsTiyYYtmjwaW
	W/6bvL6HyUlWFBoPpUJcj3ot8ikbeenwWMTdiUKdy42GKjZgdnpMZgMr4u0wHnf7JTlboLUy4vA
	WLGJsjZOX8qG4RT5F4CQW0+99aXyuk3J29QmGol82l7I/LLGJ+5cbVkkN4Bdyiiv8Oljrm4drYu
	3h/DPq28tv32c72wkMk=
X-Received: by 2002:a17:902:f64b:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2bf1fb9d40amr92235ad.2.1779997467341; Thu, 28 May 2026 12:44:27
 -0700 (PDT)
MIME-Version: 1.0
References: <20260528183625.870813-1-ynorov@nvidia.com> <20260528121806.2b54606ba6e42f7f371d95c3@linux-foundation.org>
 <ahiW5LKLiPMC6il_@yury> <20260528122903.cf74cf905418ab2d144607c3@linux-foundation.org>
 <ahiYUr0dO_dhOHTU@yury>
In-Reply-To: <ahiYUr0dO_dhOHTU@yury>
From: Ian Rogers <irogers@google.com>
Date: Thu, 28 May 2026 12:44:15 -0700
X-Gm-Features: AVHnY4KU3_bl6PIogc_loULa1uZ5IugP9iETmiYVnKICvK-frgUxDB4nRARXI20
Message-ID: <CAP-5=fXXg+PqH7EZ8X599CKYFWCwQgyH2H-4-+5M3_b9w_dTNw@mail.gmail.com>
Subject: Re: [PATCH 00/16] lib/cpumask: get rid of cpumap_print_to_pagebuf()
To: Yury Norov <ynorov@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Moritz Fischer <mdf@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jic23@kernel.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Shuai Xue <xueshuai@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
	Jiucheng Xu <jiucheng.xu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jing Zhang <renyu.zj@linux.alibaba.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Linu Cherian <lcherian@marvell.com>, Gowthami Thiagarajan <gthiagarajan@marvell.com>, 
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Khuong Dinh <khuong@os.amperecomputing.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Aboorva Devarajan <aboorvad@linux.ibm.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Besar Wicaksono <bwicaksono@nvidia.com>, 
	Ma Ke <make24@iscas.ac.cn>, Chengwen Feng <fengchengwen@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-perf-users@vger.kernel.org, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-rdma@vger.kernel.org, nvdimm@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-cxl@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_124429_667698_954031F2 
X-CRM114-Status: GOOD (  23.47  )
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

T24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgMTI6MzLigK9QTSBZdXJ5IE5vcm92IDx5bm9yb3ZAbnZp
ZGlhLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAyOCwgMjAyNiBhdCAxMjoyOTowM1BNIC0w
NzAwLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+ID4gT24gVGh1LCAyOCBNYXkgMjAyNiAxNToyNjoy
OCAtMDQwMCBZdXJ5IE5vcm92IDx5bm9yb3ZAbnZpZGlhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBP
biBUaHUsIE1heSAyOCwgMjAyNiBhdCAxMjoxODowNlBNIC0wNzAwLCBBbmRyZXcgTW9ydG9uIHdy
b3RlOgo+ID4gPiA+IE9uIFRodSwgMjggTWF5IDIwMjYgMTQ6MzY6MDcgLTA0MDAgWXVyeSBOb3Jv
diA8eW5vcm92QG52aWRpYS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBjcHVtYXBfcHJp
bnRfdG9fcGFnZWJ1ZigpIGlzIHRoZSBlcXVpdmFsZW50IGZvciB0aGUgIiYqcGJbbF0iIG5vdGF0
aW9uCj4gPiA+ID4gPiBpbiBwcmludGstbGlrZSBmdW5jdGlvbnMuIEluIHNvbWUgY2FzZXMsIGl0
IG1ha2VzIHBlb3BsZSB0byBjcmVhdGUKPiA+ID4gPiA+IHRlbXBvcmFyeSBidWZmZXJzIGZvciB0
aGUgcHJpbnRlZCBjcHVtYXNrcywgd2hlcmUgaXQgY2FuIGJlIGF2b2lkZWQuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gR2V0IHJpZCBvZiBpdCBpbiBhIGZhdm9yIG9mIG1vcmUgc3RhbmRhcmQgcHJpbnRp
bmcgQVBJLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEVhY2ggcGF0Y2gsIGV4Y2VwdCBmb3IgdGhlIGxh
c3Qgb25lLCBpcyBpbmRlcGVuZGVudCBhbmQgbWF5IGJlIG1vdmVkIHdpdGgKPiA+ID4gPiA+IHRo
ZSBjb3JyZXNwb25kaW5nIHN1YnN5c3RlbS4gT3IgSSBjYW4gdGFrZSBpdCBpbiBiaXRtYXAtZm9y
LW5leHQsIGF0Cj4gPiA+ID4gPiBtYWludGFpbmVycycgZGlzY3JldGlvbi4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBPbiB0b3Agb2YgYml0bWFwLWZvci1uZXh0Lgo+ID4gPiA+Cj4gPiA+ID4gU2FzaGlr
byBkb2Vzbid0IGF0dGVtcHQgYml0bWFwLWZvci1uZXh0LCBzbyBpdCBjb3VsZG4ndCBhcHBseSB0
aGlzIHNlcmllcy4KPiA+ID4gPiAgIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MDUyODE4MzYyNS44NzA4MTMtMS15bm9yb3ZAbnZpZGlhLmNvbQo+ID4gPgo+ID4gPiBPSy4uLiBX
aGF0IHNob3VsZCBJIGRvIGFib3V0IHRoYXQ/Cj4gPgo+ID4gUmViYXNlIG9udG8gc29tZXRoaW5n
IHdoaWNoIFNhc2hpa28gKmRvZXMqIGF0dGVtcHQuICBNYWlubGluZSwgYSBmZXcKPiA+IG1tLmdp
dCBicmFuY2hlcy4gIE1heWJlIGxpbnV4LW5leHQuCj4KPiBJcyBTYXNoaWtvIGEgbmV3IG1hbmRh
dG9yeSByZXF1aXJlbWVudCBub3c/IERvY3VtZW50YXRpb24gZG9lc24ndCBldmVuCj4gbWVudGlv
biB0aGUgYm90Lgo+Cj4gPiBSb21hbiwgaXMgdGhlcmUgYSBsaXN0IG9mIHRyZWVzL2JyYW5jaGVz
IHdoaWNoIFNhc2hpa28gdHJpZXMgdG8gYXBwbHkKPiA+IHNlcmllcyB0bz8KPgo+IEhpIFJvbWFu
LAo+Cj4gQ2FuIHlvdSBhZGQgYml0bWFwLWZvci1uZXh0IGluIHRoZSBsaXN0PwoKRndpdywgeW91
IGNhbiBzZWUgdGhlIGxpc3Qgb2YgYnJhbmNoZXMgYXR0ZW1wdGVkIGFuZCB0aGUgU0hBIHRoZXkg
YXJlCmF0IGluIHRoZSBCYXNlbGluZSBkcm9wIGRvd246CgpCYXNlbGluZSBTdGF0dXMgTG9nCnRp
cC94ODYvY29yZSAoMGY2MWIxODYwY2MzZjUyYWVmOTAzNmQ3MjM1ZWQxZjAxNzYzMjE5MykgRmFp
bGVkIFZpZXcgTG9nCnBvd2VycGMvSEVBRCAoNjkxNmQ1NzAzZGRmOWEzOGYxZjZjMmNjNzkzMzgx
YTI0ZWU5MTRjNikgRmFpbGVkIFZpZXcgTG9nCmNoYW53b28vSEVBRCAoN2ZkMmRmMjA0ZjM0MmZj
MTdkMWEwYmZjZDQ3NGIyNDIzMmZiMGYzMikgRmFpbGVkIFZpZXcgTG9nCmxpbnV4LWFybS9IRUFE
IChkZDZjNDM4YzNlNjRhNWZmMGI1ZDdlNzhmN2Y5YmU1NDc4MDNlZjFiKSBGYWlsZWQgVmlldyBM
b2cKbGludXgtcG0vSEVBRCAoZTdhZTg5YTBjOTdjZTJiNjhiMDk4M2NkMDFlZGE2N2NmMzczNTE3
ZCkgRmFpbGVkIFZpZXcgTG9nCmxpbnV4LWZwZ2EvSEVBRCBGYWlsZWQgVmlldyBMb2cKcGNpL0hF
QUQgKDI1NGY0OTYzNGVlMTZhNzMxMTc0ZDJhZTM0YmM1MGJkNWY0NWU3MzEpIEZhaWxlZCBWaWV3
IExvZwpsaW51eC1wbS90aGVybWFsICgyMWMzMTUzNDJiODE1MjY4NzRhY2ZhMzExZjExYjNmNzJi
ZWQ0ZTE0KSBGYWlsZWQgVmlldyBMb2cKcmRtYS9IRUFEICg2NzQ2NGYzODhkNTJlYzE3MmJlNjJj
OTlmYzQzNjk3NDM3ZmZhMzg0KSBGYWlsZWQgVmlldyBMb2cKbGludXgtbmV4dC9IRUFEIChmN2Fm
OTFhZGMyMzBhYTk5ZTIzMzMwZWNmODViYzliYWRkOTc4MGFkKSBGYWlsZWQgVmlldyBMb2cKSEVB
RCAoOTE3NzE5YzQxMmM0ODY4N2Q0YTE3Njk2NWQxZmEzNTMyMGVjNDU3YykgRmFpbGVkIFZpZXcg
TG9nCgpUaGFua3MsCklhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF289CD5BD1
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jun 2026 17:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfXMgNkQzwzbPrr3WWvhLxhZvdGZrl9w0GRy5AS53RE=; b=kaEQuEtuyFt2m8
	N8o4MhZtMyMwQKGC4I/HBJCTlkhuynumYfggrxMUU1Nk8YAQegOyO2F9Ckk21Y+D3MX6ov0u3bnPV
	TRwL2Azh/kZhHgK2aHo72WR9jwCnL2MO1DnduYTfljzRk31LHw9WseRZzhbvi23887ayLT2Fikl9L
	1hfMDkNep56QL613UHGFFsa5LzYaIPri2JCGkscltzT0OA+0a3eFJi0emsSTW+LV9GeHc5589wGJF
	XlzH6o98VsRbHQAYC7OZE2QzBt6oXZvAN2xmKMrAc699idrMVq+3eihOmDxP2qfqf2Rjy017XWHEo
	VBAI0858w3dQEoT1VKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6t8-0000000Bch0-2bC9;
	Mon, 01 Jun 2026 17:57:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6t5-0000000Bcg7-46uL
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Jun 2026 17:57:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 750A94461E
	for <linux-amlogic@lists.infradead.org>; Mon,  1 Jun 2026 17:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5914E1F0089F
	for <linux-amlogic@lists.infradead.org>; Mon,  1 Jun 2026 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780336639;
	bh=Fs6zIa+oKHWvRltzPvd2mFdEu12rLJwaXHbNCVd0THk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YBEcWjLVnMFNyhTH2clkn3SS4OxRe1EiT16jl+iPdqtWZ6g6WzL01QnGkF+WWRam7
	 w/ZcqoOJqRowf8oOS8Q6viCgpRJsyJiBa+d4C5wmKbJH7tJiJhiDb93cwLqYUlDKml
	 mHXcxS57F1wvpuoDi3TBhJTiWc6lIXFRC6DLn8uGUOMYBw6GaJOyoK2kyMIyoxNc7p
	 m4+++rUeb0vl0IzyXPwELbWx2Wf/A7WH/4TyR/wup0oelEBZRQeugazaRmmGov4zso
	 HRlSs7aOsYQJ+0QyGGCrz2ZQ3fQKmzgNOCSA6CE/MEXudplG9ukTFIS7NytFwxsJHx
	 +0+P15plzbwXw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso1831676e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jun 2026 10:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+jFrK72IpClvO4N5tP4cLV7/ghF2u5e07/iIkZQ/fcj5Lc0+TnYTLlJeNZaQpfF1IzpnUYx6X0FYWj0+o7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzz+DBiabw8KxfreVzdcu9moNLai+kpMwZ9bmputVGq3wwESEB
	r0bMbrjQSnQv7/WE8c1NfcC/Fh3WDNksdIc8YGLXiYSqx+cuAcLTbzSpwFqsNpU12PufyEcATkS
	1FkieO6916Ff0efwZFfl2MK+quQZJ9tI=
X-Received: by 2002:a05:6512:8007:20b0:5aa:6395:f9c5 with SMTP id
 2adb3069b0e04-5aa73ee8720mr300250e87.27.1780336637107; Mon, 01 Jun 2026
 10:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260528183625.870813-1-ynorov@nvidia.com> <20260528183625.870813-15-ynorov@nvidia.com>
In-Reply-To: <20260528183625.870813-15-ynorov@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Jun 2026 19:57:04 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g4G9aJ1fjQxXmk1YHXh+xBojpFz207j_jz7HiLH1Lz1Q@mail.gmail.com>
X-Gm-Features: AVHnY4INVXbw7SKAZHG4Jnm8fXAHVwo_FKl3cnkJN8dTeVudl-a8v97e8VxcFA4
Message-ID: <CAJZ5v0g4G9aJ1fjQxXmk1YHXh+xBojpFz207j_jz7HiLH1Lz1Q@mail.gmail.com>
Subject: Re: [PATCH 14/16] powercap: intel_rapl: Use sysfs_emit() for cpumask show
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
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
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
	linux-arm-msm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_105720_082601_F2A6EC23 
X-CRM114-Status: GOOD (  18.40  )
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

T24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgODozN+KAr1BNIFl1cnkgTm9yb3YgPHlub3JvdkBudmlk
aWEuY29tPiB3cm90ZToKPgo+IGNwdW1hc2tfc2hvdygpIGlzIGEgc3lzZnMgc2hvdyBjYWxsYmFj
ay4gVXNlIHN5c2ZzX2VtaXQoKSBhbmQKPiBjcHVtYXNrX3ByX2FyZ3MoKSB0byBlbWl0IHRoZSBt
YXNrLgo+Cj4gVGhpcyBwcmVwYXJlcyBmb3IgcmVtb3ZpbmcgY3B1bWFwX3ByaW50X3RvX3BhZ2Vi
dWYoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1cnkgTm9yb3YgPHlub3JvdkBudmlkaWEuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL3Bvd2VyY2FwL2ludGVsX3JhcGxfY29tbW9uLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcG93ZXJjYXAvaW50ZWxfcmFwbF9jb21tb24uYyBiL2RyaXZlcnMvcG93ZXJj
YXAvaW50ZWxfcmFwbF9jb21tb24uYwo+IGluZGV4IGE4ZGQwMmRmZjBhMC4uYjM4ZDRhNzc5OWE4
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcG93ZXJjYXAvaW50ZWxfcmFwbF9jb21tb24uYwo+ICsr
KyBiL2RyaXZlcnMvcG93ZXJjYXAvaW50ZWxfcmFwbF9jb21tb24uYwo+IEBAIC0xNDQxLDcgKzE0
NDEsNyBAQCBzdGF0aWMgc3NpemVfdCBjcHVtYXNrX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+
ICAgICAgICAgfQo+ICAgICAgICAgY3B1c19yZWFkX3VubG9jaygpOwo+Cj4gLSAgICAgICByZXQg
PSBjcHVtYXBfcHJpbnRfdG9fcGFnZWJ1Zih0cnVlLCBidWYsIGNwdV9tYXNrKTsKPiArICAgICAg
IHJldCA9IHN5c2ZzX2VtaXQoYnVmLCAiJSpwYmxcbiIsIGNwdW1hc2tfcHJfYXJncyhjcHVfbWFz
aykpOwo+Cj4gICAgICAgICBmcmVlX2NwdW1hc2tfdmFyKGNwdV9tYXNrKTsKPgo+IC0tCgpBcHBs
aWVkICh3aXRoIGFkanVzdGVkIHN1YmplY3QgYW5kIGNoYW5nZWxvZykgYXMgNy4yIG1hdGVyaWFs
LCB0aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==

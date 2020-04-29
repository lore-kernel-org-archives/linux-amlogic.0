Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CB0C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 17:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A47B22083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 17:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XnEj+0tx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bvclRFDu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A47B22083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Li+hqb4z8lT5aLMUktrE39TBXZKjWG0Rg9HaZ3EFZkI=; b=XnEj+0tx/EG3d2SpqIVof0K7p
	poV/MQ2C63MuFtJvqFMhwxIzmdGZXF+ZrcD1BHgK/U50WQE2PV/1UZzrFZNPh9BeY51niGyZsnFnJ
	d7qHBBfkG2yrqK1qv6tmVvxBVK21CtQIu8JLdLkTn48u6vyccPJyeXxIvt93jYTr2Uvg5lXdwnxCg
	HYg1gA7f001C2mohaGAcEbxe/eqLCE8Hzv8OU7X9l0HFnWZ0RZ69T2DvInFl6YRTGZR4Et0BVcbUH
	nf9CQZblXWmTS4dKNfFVehp/ttzxH1AnOCoVgkXNWiAhThmY1idSMVx2fs2cV6ixylILM61mVOO3o
	SbWZ8mVNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTqkl-0007Ru-SS; Wed, 29 Apr 2020 17:44:11 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTqki-0007Qr-KG
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 17:44:10 +0000
Received: by mail-ej1-x643.google.com with SMTP id x1so2286477ejd.8
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eC8iaDbgklls5vEW6hsS6u3vGO3A7JOSp8YigJew5EA=;
 b=bvclRFDuLkpTtiVgsW0BitiFkM6+uhKOeMNaZdxP9IJ82a5ULdAJ2VH3S+nGkpNIaQ
 EDaiWmDWLw5kX/3tH1rJKurL/Ti317bdXQczBcfEMms7ESkO9MSaryPQUtpc8XF87mrP
 NESSGlqbBUJTdbLFxU7eD6+aGkeGjtVfdLOs2rtlF4Q43FnyD9oH09/ci9XJEBTelD7S
 y65keStSIqnp/yt3jpxhHrbTydYFPDudkA5mE2aoZR3tW29J0s6qfynsmdLnlZ7UmEii
 rROG/jhH9TKectRAZVexXhuftpBEB49ArxKa+pM4Q2vuICV1zymxkwdgfKQm0fV3puAp
 tJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eC8iaDbgklls5vEW6hsS6u3vGO3A7JOSp8YigJew5EA=;
 b=dwpZwtDg3G5ehV1DmxIXrZ9Vm98U5Ov8MSVR4NgTiwPH5tG1eErk9FkcyemYHOjXVu
 D64khhmEockid0DZoF8OeCpNZO6A58XJjHat6NnP2fzVGknF3qowYB6tuH5pYr1/6qpN
 X2aQs9cWvv07HEC4xIFaCgHyQGD2sbYq0MEbCUn98kC9EMM5uEKZF102SXmDAS0DYslD
 bPGv9X/kh7NhJDpEZJ2IEYpWB3OzYBVb4PkbLzZlIkhvzJbc4la2dCwcQE7ERdsrpXyL
 oHbx7CaL993ypM427LSGVPo91eteiqV5tC5CGnNkUgBVZKXF+cLvyH1eumKA4yIIuBHH
 T8dg==
X-Gm-Message-State: AGi0PuYEpdaLjyXKnuyejLelANDQ1ALnHJ690MhbEE0KRD1INWwXoD7U
 /CvCy16/6rNuwZvNK4/D/yxNSTCD0T7mpPEv8fa3s3o+5m0=
X-Google-Smtp-Source: APiQypLcy59K8yI8s2YAWFG1X4qnbzsHZf0eTrejp+c/a99T3hELKI7xRKfN73qSeyuW0CwE+k3wjnlIMLk/vVF0QEI=
X-Received: by 2002:a17:906:1a06:: with SMTP id
 i6mr3710924ejf.90.1588182246619; 
 Wed, 29 Apr 2020 10:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200429031416.3900-1-bernard@vivo.com>
 <1jpnbqii2y.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jpnbqii2y.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 29 Apr 2020 19:43:55 +0200
Message-ID: <CAFBinCA7CvBzEYMG+VmJTRF9zxajj1KOHt0F4A2hUJhKrTpmhw@mail.gmail.com>
Subject: Re: [PATCH] clk/meson: fixes memleak issue in init err branch
To: Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="000000000000a6133905a4717e48"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_104408_692703_3E32EDB4 
X-CRM114-Status: GOOD (  24.81  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: opensource.kernel@vivo.com, Neil Armstrong <narmstrong@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Bernard Zhao <bernard@vivo.com>,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--000000000000a6133905a4717e48
Content-Type: text/plain; charset="UTF-8"

Hi Jerome,

On Wed, Apr 29, 2020 at 2:37 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Wed 29 Apr 2020 at 05:14, Bernard Zhao <bernard@vivo.com> wrote:
>
> > In common init function, when run into err branch, we didn`t
> > use kfree to release kzmalloc area, this may bring in memleak
>
> Thx for reporting this Bernard.
> I'm not a fan of adding kfree everywhere. I'd much prefer a label and
> clear error exit path.
>
> That being said, the allocation is probably not the only thing that
> needs to be undone in case of error. I guess this is due to conversion
> to CLK_OF_DECLARE_DRIVER() which forced to drop all the devm_
> This was done because the clock controller was required early in the
> boot sequence.
>
> There is 2 paths to properly solve this:
> 1) Old school: manually undo everything with every error exit condition
>    Doable but probably a bit messy
> 2) Convert back the driver to a real platform driver and use devm_.
>    We would still need the controller to register early but I wonder if
>    we could use the same method as drivers/clk/mediatek/clk-mt2701.c and
>    use arch_initcall() ?
>
> Martin, you did the initial conversion, what do you think of option 2 ?
I tried it with the attached patch
unfortunately my "m8b_clkc_test_probe" is still run too late

> Would it still answer the problem you were trying to solve back then ?
I'm afraid it does not:
- the resets are needed early for SMP initialization
- the clocks are needed even earlier for timer registration (we have
both, the ARM TWD timer and some Amlogic custom timer. both have clock
inputs)

> One added benefit of option 2 is we could drop CLK_OF_DECLARE_DRIVER().
> We could even do the same in for the other SoCs, which I suppose would
> avoid a fair amount of probe deferral.
it would be great, indeed
but this will only work once timer initialization and SMP boot can
happen at a later stage

If the clock controller registration fails the board won't boot. Yes,
cleaning up memory is good, but in this specific case it will add a
couple of extra CPU cycles before the kernel is dead
So, if we want to ignore that fact then I agree with your first option
(undoing things the "old school" way).


Martin

--000000000000a6133905a4717e48
Content-Type: text/plain; charset="US-ASCII"; name="test-dmesg.txt"
Content-Disposition: attachment; filename="test-dmesg.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k9lmcht60>
X-Attachment-Id: f_k9lmcht60

WyAgICAwLjAwMDAwMF0gQm9vdGluZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgyMDAKWyAgICAw
LjAwMDAwMF0gTGludXggdmVyc2lvbiA1LjcuMC1yYzMtMDAxNDItZzBiZTQ0MmZjMTZjOC1kaXJ0
eSAoeGRhcmtsaWdodEBibGFja2JveCkgKGdjYyB2ZXJzaW9uIDkuMy4wIChBcmNoIFJlcG9zaXRv
cnkpLCBHTlUgbGQgKEdOVSBCaW51dGlscykgMi4zNCkgIzYzOTcgU01QIFBSRUVNUFQgV2VkIEFw
ciAyOSAxOTozMjowNyBDRVNUIDIwMjAKWyAgICAwLjAwMDAwMF0gQ1BVOiBBUk12NyBQcm9jZXNz
b3IgWzQxMGZjMDUxXSByZXZpc2lvbiAxIChBUk12NyksIGNyPTEwYzUzODdkClsgICAgMC4wMDAw
MDBdIENQVTogUElQVCAvIFZJUFQgbm9uYWxpYXNpbmcgZGF0YSBjYWNoZSwgVklQVCBhbGlhc2lu
ZyBpbnN0cnVjdGlvbiBjYWNoZQpbICAgIDAuMDAwMDAwXSBPRjogZmR0OiBNYWNoaW5lIG1vZGVs
OiBFbmRsZXNzIENvbXB1dGVycyBFbmRsZXNzIE1pbmkKWyAgICAwLjAwMDAwMF0gTWVtb3J5IHBv
bGljeTogRGF0YSBjYWNoZSB3cml0ZWFsbG9jClsgICAgMC4wMDAwMDBdIGNtYTogUmVzZXJ2ZWQg
NjQgTWlCIGF0IDB4N2MwMDAwMDAKWyAgICAwLjAwMDAwMF0gcGVyY3B1OiBFbWJlZGRlZCAxNiBw
YWdlcy9jcHUgczM0ODI0IHI4MTkyIGQyMjUyMCB1NjU1MzYKWyAgICAwLjAwMDAwMF0gQnVpbHQg
MSB6b25lbGlzdHMsIG1vYmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6IDUyMjA1Mgpb
ICAgIDAuMDAwMDAwXSBLZXJuZWwgY29tbWFuZCBsaW5lOiBjb25zb2xlPXR0eUFNTDAsMTE1MjAw
IHJvb3Q9L2Rldi9zZGExIHJ3ClsgICAgMC4wMDAwMDBdIERlbnRyeSBjYWNoZSBoYXNoIHRhYmxl
IGVudHJpZXM6IDEzMTA3MiAob3JkZXI6IDcsIDUyNDI4OCBieXRlcywgbGluZWFyKQpbICAgIDAu
MDAwMDAwXSBJbm9kZS1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDY1NTM2IChvcmRlcjogNiwg
MjYyMTQ0IGJ5dGVzLCBsaW5lYXIpClsgICAgMC4wMDAwMDBdIG1lbSBhdXRvLWluaXQ6IHN0YWNr
Om9mZiwgaGVhcCBhbGxvYzpvZmYsIGhlYXAgZnJlZTpvZmYKWyAgICAwLjAwMDAwMF0gTWVtb3J5
OiAxOTY1Njk2Sy8yMDk1MTA0SyBhdmFpbGFibGUgKDE4NDMySyBrZXJuZWwgY29kZSwgNzI3SyBy
d2RhdGEsIDY4MjBLIHJvZGF0YSwgMTAyNEsgaW5pdCwgOTU4SyBic3MsIDYzODcySyByZXNlcnZl
ZCwgNjU1MzZLIGNtYS1yZXNlcnZlZCwgMTI0NTE4NEsgaGlnaG1lbSkKWyAgICAwLjAwMDAwMF0g
cmFuZG9tOiBnZXRfcmFuZG9tX3UzMiBjYWxsZWQgZnJvbSBfX2ttZW1fY2FjaGVfY3JlYXRlKzB4
MjgvMHgzOGMgd2l0aCBjcm5nX2luaXQ9MApbICAgIDAuMDAwMDAwXSBTTFVCOiBIV2FsaWduPTY0
LCBPcmRlcj0wLTMsIE1pbk9iamVjdHM9MCwgQ1BVcz00LCBOb2Rlcz0xClsgICAgMC4wMDAwMDBd
IHJjdTogUHJlZW1wdGlibGUgaGllcmFyY2hpY2FsIFJDVSBpbXBsZW1lbnRhdGlvbi4KWyAgICAw
LjAwMDAwMF0gcmN1OiAgICAgUkNVIHJlc3RyaWN0aW5nIENQVXMgZnJvbSBOUl9DUFVTPTggdG8g
bnJfY3B1X2lkcz00LgpbICAgIDAuMDAwMDAwXSAgVGFza3MgUkNVIGVuYWJsZWQuClsgICAgMC4w
MDAwMDBdIHJjdTogUkNVIGNhbGN1bGF0ZWQgdmFsdWUgb2Ygc2NoZWR1bGVyLWVubGlzdG1lbnQg
ZGVsYXkgaXMgMjUgamlmZmllcy4KWyAgICAwLjAwMDAwMF0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0
cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0xNiwgbnJfY3B1X2lkcz00ClsgICAgMC4wMDAwMDBdIE5S
X0lSUVM6IDE2LCBucl9pcnFzOiAxNiwgcHJlYWxsb2NhdGVkIGlycXM6IDE2ClsgICAgMC4wMDAw
MDBdIGlycV9tZXNvbl9ncGlvOiAxMTkgdG8gOCBncGlvIGludGVycnVwdCBtdXggaW5pdGlhbGl6
ZWQKWyAgICAwLjAwMDAwMF0gTDJDOiBEVC9wbGF0Zm9ybSBtb2RpZmllcyBhdXggY29udHJvbCBy
ZWdpc3RlcjogMHgwMjA2MDAwMCAtPiAweDAyNDYwMDAwClsgICAgMC4wMDAwMDBdIEwyQy0zMTAg
ZXJyYXR1bSA3Njk0MTkgZW5hYmxlZApbICAgIDAuMDAwMDAwXSBMMkMtMzEwIElEIHByZWZldGNo
IGVuYWJsZWQsIG9mZnNldCAxIGxpbmVzClsgICAgMC4wMDAwMDBdIEwyQy0zMTAgZHluYW1pYyBj
bG9jayBnYXRpbmcgZW5hYmxlZCwgc3RhbmRieSBtb2RlIGVuYWJsZWQKWyAgICAwLjAwMDAwMF0g
TDJDLTMxMCBjYWNoZSBjb250cm9sbGVyIGVuYWJsZWQsIDggd2F5cywgNTEyIGtCClsgICAgMC4w
MDAwMDBdIEwyQy0zMTA6IENBQ0hFX0lEIDB4NDEwMGEwYzksIEFVWF9DVFJMIDB4MzY0NjAwMDAK
WyAgICAwLjAwMDAyMF0gc2NoZWRfY2xvY2s6IDMyIGJpdHMgYXQgMTAwMGtIeiwgcmVzb2x1dGlv
biAxMDAwbnMsIHdyYXBzIGV2ZXJ5IDIxNDc0ODM2NDc1MDBucwpbICAgIDAuMDAwMDQ4XSBjbG9j
a3NvdXJjZTogdGltZXI6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwg
bWF4X2lkbGVfbnM6IDE5MTEyNjA0NDYyNzUgbnMKWyAgICAwLjAwMDA5N10gU3dpdGNoaW5nIHRv
IHRpbWVyLWJhc2VkIGRlbGF5IGxvb3AsIHJlc29sdXRpb24gMTAwMG5zClsgICAgMC4wMDA5MTNd
IENvbnNvbGU6IGNvbG91ciBkdW1teSBkZXZpY2UgODB4MzAKWyAgICAwLjAwMDk3MF0gQ2FsaWJy
YXRpbmcgZGVsYXkgbG9vcCAoc2tpcHBlZCksIHZhbHVlIGNhbGN1bGF0ZWQgdXNpbmcgdGltZXIg
ZnJlcXVlbmN5Li4gMi4wMCBCb2dvTUlQUyAobHBqPTQwMDApClsgICAgMC4wMDA5ODldIHBpZF9t
YXg6IGRlZmF1bHQ6IDMyNzY4IG1pbmltdW06IDMwMQpbICAgIDAuMDAxMzYyXSBMU006IFNlY3Vy
aXR5IEZyYW1ld29yayBpbml0aWFsaXppbmcKWyAgICAwLjAwMTY5Nl0gU21hY2s6ICBJbml0aWFs
aXppbmcuClsgICAgMC4wMDE3MDZdIFNtYWNrOiAgSVB2NiBwb3J0IGxhYmVsaW5nIGVuYWJsZWQu
ClsgICAgMC4wMDE5MzRdIE1vdW50LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMjA0OCAob3Jk
ZXI6IDEsIDgxOTIgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjAwMTk1OF0gTW91bnRwb2ludC1jYWNo
ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDIwNDggKG9yZGVyOiAxLCA4MTkyIGJ5dGVzLCBsaW5lYXIp
ClsgICAgMC4wMDMzOTJdIENQVTogVGVzdGluZyB3cml0ZSBidWZmZXIgY29oZXJlbmN5OiBvawpb
ICAgIDAuMDAzNzg3XSBDUFUwOiB0aHJlYWQgLTEsIGNwdSAwLCBzb2NrZXQgMiwgbXBpZHIgODAw
MDAyMDAKWyAgICAwLjAwNTI0N10gU2V0dGluZyB1cCBzdGF0aWMgaWRlbnRpdHkgbWFwIGZvciAw
eDMwMDAwMCAtIDB4MzAwMDYwClsgICAgMC4wMDU1MDldIHJjdTogSGllcmFyY2hpY2FsIFNSQ1Ug
aW1wbGVtZW50YXRpb24uClsgICAgMC4wMDY2NjNdIHNtcDogQnJpbmdpbmcgdXAgc2Vjb25kYXJ5
IENQVXMgLi4uClsgICAgMC4wMDc3ODJdIENQVTE6IHRocmVhZCAtMSwgY3B1IDEsIHNvY2tldCAy
LCBtcGlkciA4MDAwMDIwMQpbICAgIDAuMDA5MTYxXSBDUFUyOiB0aHJlYWQgLTEsIGNwdSAyLCBz
b2NrZXQgMiwgbXBpZHIgODAwMDAyMDIKWyAgICAwLjAxMDM4NF0gQ1BVMzogdGhyZWFkIC0xLCBj
cHUgMywgc29ja2V0IDIsIG1waWRyIDgwMDAwMjAzClsgICAgMC4wMTA1NzNdIHNtcDogQnJvdWdo
dCB1cCAxIG5vZGUsIDQgQ1BVcwpbICAgIDAuMDEwNTk5XSBTTVA6IFRvdGFsIG9mIDQgcHJvY2Vz
c29ycyBhY3RpdmF0ZWQgKDguMDAgQm9nb01JUFMpLgpbICAgIDAuMDEwNjA4XSBDUFU6IEFsbCBD
UFUocykgc3RhcnRlZCBpbiBTVkMgbW9kZS4KWyAgICAwLjAxMTU5NV0gZGV2dG1wZnM6IGluaXRp
YWxpemVkClsgICAgMC4wMjAxMjVdIFZGUCBzdXBwb3J0IHYwLjM6IGltcGxlbWVudG9yIDQxIGFy
Y2hpdGVjdHVyZSAyIHBhcnQgMzAgdmFyaWFudCA1IHJldiAxClsgICAgMC4wMjEwOTJdIGNsb2Nr
c291cmNlOiBqaWZmaWVzOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZmZmYs
IG1heF9pZGxlX25zOiA3NjQ1MDQxNzg1MTAwMDAwIG5zClsgICAgMC4wMjExMjNdIGZ1dGV4IGhh
c2ggdGFibGUgZW50cmllczogMTAyNCAob3JkZXI6IDQsIDY1NTM2IGJ5dGVzLCBsaW5lYXIpClsg
ICAgMC4wMjU0MzldIHhvcjogbWVhc3VyaW5nIHNvZnR3YXJlIGNoZWNrc3VtIHNwZWVkClsgICAg
MC4wNjQzMzZdICAgIGFybTRyZWdzICA6ICAgNjY2LjAwMCBNQi9zZWMKWyAgICAwLjEwNDMzN10g
ICAgOHJlZ3MgICAgIDogICA2MzMuMDAwIE1CL3NlYwpbICAgIDAuMTQ0MzQ0XSAgICAzMnJlZ3Mg
ICAgOiAgIDU4Ni4wMDAgTUIvc2VjClsgICAgMC4xODQzNDNdICAgIG5lb24gICAgICA6ICAgNjU3
LjAwMCBNQi9zZWMKWyAgICAwLjE4NDM1Nl0geG9yOiB1c2luZyBmdW5jdGlvbjogYXJtNHJlZ3Mg
KDY2Ni4wMDAgTUIvc2VjKQpbICAgIDAuMTg0NDM1XSBwaW5jdHJsIGNvcmU6IGluaXRpYWxpemVk
IHBpbmN0cmwgc3Vic3lzdGVtClsgICAgMC4xODU0NzFdIHRoZXJtYWxfc3lzOiBSZWdpc3RlcmVk
IHRoZXJtYWwgZ292ZXJub3IgJ2ZhaXJfc2hhcmUnClsgICAgMC4xODU0NzddIHRoZXJtYWxfc3lz
OiBSZWdpc3RlcmVkIHRoZXJtYWwgZ292ZXJub3IgJ2JhbmdfYmFuZycKWyAgICAwLjE4NTQ5MV0g
dGhlcm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAnc3RlcF93aXNlJwpbICAg
IDAuMTg1NTAxXSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdvdmVybm9yICd1c2Vy
X3NwYWNlJwpbICAgIDAuMTg2Nzg5XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE2
ClsgICAgMC4xODk5NzZdIERNQTogcHJlYWxsb2NhdGVkIDI1NiBLaUIgcG9vbCBmb3IgYXRvbWlj
IGNvaGVyZW50IGFsbG9jYXRpb25zClsgICAgMC4xOTA3MjldIGF1ZGl0OiBpbml0aWFsaXppbmcg
bmV0bGluayBzdWJzeXMgKGRpc2FibGVkKQpbICAgIDAuMTkxMDQ2XSBhdWRpdDogdHlwZT0yMDAw
IGF1ZGl0KDAuMTg4OjEpOiBzdGF0ZT1pbml0aWFsaXplZCBhdWRpdF9lbmFibGVkPTAgcmVzPTEK
WyAgICAwLjE5MjA3OV0gY3B1aWRsZTogdXNpbmcgZ292ZXJub3IgbWVudQpbICAgIDAuMTkyMzY3
XSBObyBBVEFHcz8KWyAgICAwLjE5MjU2Nl0gaHctYnJlYWtwb2ludDogZm91bmQgMiAoKzEgcmVz
ZXJ2ZWQpIGJyZWFrcG9pbnQgYW5kIDEgd2F0Y2hwb2ludCByZWdpc3RlcnMuClsgICAgMC4xOTI1
ODNdIGh3LWJyZWFrcG9pbnQ6IG1heGltdW0gd2F0Y2hwb2ludCBzaXplIGlzIDQgYnl0ZXMuClsg
ICAgMC4xOTQ0NDNdIGNsay1tOGItdGVzdCBjMTEwNDAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9j
ay1jb250cm9sbGVyOiBtOGJfY2xrY190ZXN0IElOSVQKLi4uLgo=
--000000000000a6133905a4717e48
Content-Type: text/x-patch; charset="US-ASCII"; name="test.patch"
Content-Disposition: attachment; filename="test.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k9lmchtg1>
X-Attachment-Id: f_k9lmchtg1

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL21lc29uOGIuYyBiL2RyaXZlcnMvY2xrL21l
c29uL21lc29uOGIuYwppbmRleCA5NTY3OGEyYjAxN2MuLjkyYWQxMzQxODYwNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9jbGsvbWVzb24vbWVzb244Yi5jCisrKyBiL2RyaXZlcnMvY2xrL21lc29uL21l
c29uOGIuYwpAQCAtMzg2MywzICszODYzLDMyIEBAIENMS19PRl9ERUNMQVJFX0RSSVZFUihtZXNv
bjhiX2Nsa2MsICJhbWxvZ2ljLG1lc29uOGItY2xrYyIsCiAJCSAgICAgIG1lc29uOGJfY2xrY19p
bml0KTsKIENMS19PRl9ERUNMQVJFX0RSSVZFUihtZXNvbjhtMl9jbGtjLCAiYW1sb2dpYyxtZXNv
bjhtMi1jbGtjIiwKIAkJICAgICAgbWVzb244bTJfY2xrY19pbml0KTsKKworI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgorCitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBvZl9tYXRjaF9tOGJfY2xrY190ZXN0W10gPSB7CisJeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LG1lc29uOGItY2xrYyIsIH0sCisJeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uOG0yLWNs
a2MiLCB9LAorCXsgLyogc2VudGluZWwgKi8gfQorfTsKKworc3RhdGljIGludCBtOGJfY2xrY190
ZXN0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCit7CisJZGV2X2VycigmcGRl
di0+ZGV2LCAibThiX2Nsa2NfdGVzdCBJTklUXG4iKTsKKwlyZXR1cm4gMDsKK30KKworc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbThiX2Nsa2NfdGVzdF9kcnYgPSB7CisJLnByb2JlID0g
bThiX2Nsa2NfdGVzdF9wcm9iZSwKKwkuZHJpdmVyID0geworCQkubmFtZSA9ICJjbGstbThiLXRl
c3QiLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9tOGJfY2xrY190ZXN0LAorCX0sCit9
OworCitzdGF0aWMgaW50IF9faW5pdCBtOGJfY2xrY190ZXN0X2luaXQodm9pZCkKK3sKKwlyZXR1
cm4gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZtOGJfY2xrY190ZXN0X2Rydik7Cit9CisKK2Fy
Y2hfaW5pdGNhbGwobThiX2Nsa2NfdGVzdF9pbml0KTsK
--000000000000a6133905a4717e48
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--000000000000a6133905a4717e48--


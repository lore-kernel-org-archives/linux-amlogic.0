Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1B7C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 20:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Mi/i4DTtpoX+CBA1io1zAssoiNhix5RM9RWBE+tQzk=; b=Xcqt5tPSu0j9JL
	FBcpSMwRZVKKQa4a+CQn/42J/1xSnxeAGZtRp/wmCKsRlHLP9bhOCIuHlRvNgy2BVkjldVkYiA4F/
	oOOlHNAR69ZDZbJTugLwbrHbZpCBnhUrN9675bF+H6LffAYP4d6kmwaGrjSqC3LFLsMBvEiYP9ZFJ
	gsKgfiDFZUzK8jR2lSirdyFKc1DWCuU/V97LiDZUFI5cjY+6ekv+0FBMSvW8Z0lPoUy0reNHvQ17d
	ATL38SKjXVcieERFNG038h5XgxuetmAukSJogemYqHz5BbYCl5gDO+QRMepG5qIFg7knodb46vY4v
	+b+teBW0I6C2wfa9sKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgAuV-007NIK-2O;
	Sat, 25 Mar 2023 20:54:47 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgAuR-007NHk-0s
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Mar 2023 20:54:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id y4so21180186edo.2
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Mar 2023 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679777681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JD8VByDBApmKkSxXV7CpU6HAw7XVhATCFUgg/QKctyw=;
        b=JpScZ5++65Zn9M6Q9VeuCKg8hibGiIHDJHxW2ETK5IHhP2bpCK2hkaI/jFbM9aRfI6
         NlfhZZfvrT8pCdv9G72uXc6OjkqjPE89bpbeYgF6UjniOcUlJ8XljO+s66wcYtUycTbm
         9GhytcwjFpadM3mvjf4C9eneLl6mBaAvinj0Ty82pGXcgoir/NqV+fQ4x2ahCqcTwdns
         7oA91eQfnhFIKWS/x/c6jqeO37beXCd500gZonuzqAfsigRQvBahxGsLvYywpHdkoNYL
         89vImfRzBKGBJz06gEyf6jKcODMB7iwugTVfzL1pKp0Zxczjhe8YkOGh9xKJ883JFTKB
         wsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679777681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD8VByDBApmKkSxXV7CpU6HAw7XVhATCFUgg/QKctyw=;
        b=jhliOrcEmJbpK6PHLc0ihDMtytIWM0Qn1cS1n5/Y9vKIVZK0EbYShFKW0yNKA0i8kM
         2BJAsgYBTWjjaToYxVcyhGbo5tM0sArmAKbo0ruq+M4tBJjWxY/T1+wjX/1WQ4KYGwZ0
         HE+T5I2BGsxsSCCDmvo32wcM4sbND77qXpsUuXyJj9t9wphkVvVqaqhkENo+KTrKbY1f
         g0tgnuGmRf0gGUdNkfBuN8BjWinzalE1bE2TOlbdtv7MEQGrAOTsYOZPCRFbImrVlMXR
         m0rIVsTL/sWtWQc3oaipdN7nkzjgsb7LVs+nXS3uvP7hr56jd6hIX5mtuRRejdNfv45B
         Ze3w==
X-Gm-Message-State: AAQBX9cfw9CvwE+qNynMIxHauNG64HIm4PfQQRxyjx8XR50sQExNA0sp
	GRluN0j8sQ34Y+WIsaXKLW6buyDtKDFxfmcXzn0=
X-Google-Smtp-Source: AKy350YmVq1F4OtnF69rXL3URjEXaxpREgeDLFL/fFSqa4gf/quHg+wSEfwrKgxVyNOAj0M9W/ocnaQC1jOaIP/5aYg=
X-Received: by 2002:a17:906:6a03:b0:930:90ce:a1a6 with SMTP id
 qw3-20020a1709066a0300b0093090cea1a6mr3447967ejc.6.1679777680736; Sat, 25 Mar
 2023 13:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr> <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
 <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
 <c3b9c231-10ef-ef69-c702-9e1052b8e704@free.fr> <471489bc-8683-f1ba-3f5c-5a8bf299446a@free.fr>
 <CAFBinCBD38gcR+foUUm6JBOfdpzW1Q3g3nFowxoWG1LGSc31kQ@mail.gmail.com>
 <3f4a7735-5327-df75-79ac-66209dbffa37@free.fr> <a81a1ebd-2621-ded1-855d-bd91d923436b@free.fr>
In-Reply-To: <a81a1ebd-2621-ded1-855d-bd91d923436b@free.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Mar 2023 21:54:29 +0100
Message-ID: <CAFBinCDmzgh2eHbJHbi+90DQsyUqUgoxHmqha3URD0KZmi5T5Q@mail.gmail.com>
Subject: Re: [PATCH] perf/amlogic: resolve conflict between canvas & pmu
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jiucheng Xu <jiucheng.xu@amlogic.com>, 
	AML <linux-amlogic@lists.infradead.org>, Chris Healy <healych@amazon.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Pierre-Hugues Husson <phh@phh.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_135443_350298_4BA01FCB 
X-CRM114-Status: GOOD (  12.58  )
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

SGkgTWFyYywKCnRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzIQoKT24gVGh1LCBNYXIgMjMsIDIw
MjMgYXQgNToyNOKAr1BNIE1hcmMgR29uemFsZXogPG1hcmMudy5nb256YWxlekBmcmVlLmZyPiB3
cm90ZToKPgo+IEFjY29yZGluZyB0byBTOTA1WDIgRGF0YXNoZWV0IC0gUmV2aXNpb24gMDc6Cj4K
PiBETUNfTU9OIGFyZWEgc3BhbnMgMHhmZjYzODA4MC0weGZmNjM4MGMwCj4gRERSX1BMTCBhcmVh
IHNwYW5zIDB4ZmY2MzhjMDAtMHhmZjYzOGMzNAo+Cj4gUm91bmQgRERSX1BMTCBhcmVhIHNpemUg
dXAgdG8gMHg0MAo+Cj4gRml4ZXM6IDkwY2Y4ZTIxMDE2ZiAoImFybTY0OiBkdHM6IG1lc29uOiBB
ZGQgRERSIFBNVSBub2RlIikKVGhpcyBpcyBvbmx5IHBhcnRpYWxseSBjb3JyZWN0LiBXZSBhbHNv
IG5lZWQ6CkZpeGVzOiAyMDE2ZTIxMTNkMzUgKCJwZXJmL2FtbG9naWM6IEFkZCBzdXBwb3J0IGZv
ciBBbWxvZ2ljIG1lc29uIEcxMgpTb0MgRERSIFBNVSBkcml2ZXIiKQoKPiBTaWduZWQtb2ZmLWJ5
OiBNYXJjIEdvbnphbGV6IDxtYXJjLncuZ29uemFsZXpAZnJlZS5mcj4KPiAtLS0KPiAgYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaSB8IDEyICsrKysrKy0t
LS0tLQo+ICBkcml2ZXJzL3BlcmYvYW1sb2dpYy9tZXNvbl9nMTJfZGRyX3BtdS5jICAgICAgICAg
IHwgMzQgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQpJIHRoaW5rIGl0IG1ha2Vz
IHNlbnNlIHRvIHNwbGl0IHRoaXMgcGF0Y2ggaW50byB0d28gc2VwYXJhdGUgcGF0Y2hlcywKZWFj
aCBvZiB0aGVtIHdpdGggdGhlIHByb3BlciBGaXhlcyB0YWcgYXR0YWNoZWQgKGFuZCBzdWJqZWN0
IHByZWZpeCkuClRoYXQgd2F5IHRoZSBtYWludGFpbmVycyBvZiB0aGUgYWNjb3JkaW5nIGZpbGVz
IGNhbiBwaWNrIHRoZW0gdXAgKC5kdHMKYW5kIGRyaXZlciBjaGFuZ2VzIHVzdWFsbHkgZ28gdGhy
b3VnaCBkaWZmZXJlbnQgdHJlZXMsIEkgZXhwZWN0IHRoaXMKdG8gYmUgdGhlIGNhc2UgaGVyZSBh
cyB3ZWxsKS4KCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgZHJpdmVyIGNoYW5nZXMgd2ls
bCBnbyB0aHJvdWdoIGEgdHJlZQpvdGhlciB0aGFuIHRoZSBBbWxvZ2ljIG9uZSAoSSBzdXNwZWN0
IGl0J3MgV2lsbCBEZWFjb24ncyB0cmVlKS4KUGxlYXNlIENjIHRoZSBvdGhlciBtYWludGFpbmVy
cyBhbmQgbWFpbGluZyBsaXN0cyBhcyBzaG93biBieQpzY3JpcHRzL2dldF9tYWludGFpbmVyLnBs
OgogIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+IChtYWludGFpbmVyOkFSTSBQTVUgUFJP
RklMSU5HIEFORCBERUJVR0dJTkcpCiAgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNv
bT4gKG1haW50YWluZXI6QVJNIFBNVSBQUk9GSUxJTkcKQU5EIERFQlVHR0lORykKICBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBsaXN0OkFSTS9BbWxvZ2lj
Ck1lc29uIFNvQyBzdXBwb3J0KQoKVGhlIGNvbnRlbnRzIG9mIHRoZSBwYXRjaCBsb29rIGdvb2Qg
dG8gbWUgLSBzbyB0aGlzIGlzIG9ubHkgYWJvdXQKb3JnYW5pemluZyB0aGluZ3MuCgoKQmVzdCBy
ZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK

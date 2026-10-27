Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0F606A329
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ev7N7bQF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M7Zm5MxW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+Gqc0B435luawYus6hJsgX1DLTy61iwbkuY3wLQlahU=; b=Ev7N7bQFbTYjJPf3oHbOisqZR5
	GhqcCrCxg6UrFdf7JCvnljZwgpsOIFddzbLAbf1ooQgstifsp9Aya86INFWOToI3GP+XZZpN02a2o
	s2YIvUp4ybV8RvQZZjmIMby7H+moPBqJOrdBRYLvs/kvZYEG1q0wA944YDb+WIgYSxDOYY3tYoHWw
	mrOaCM3bX6NMoyujdc4uNn3y8vi8HIljr+vPAwoSCMGJNFfcFV9yM/lntBcP65YT1IMyKpBNO3fr/
	djegS7lPTVUUuhWqsHDfwD+woCwPLWI4iMpaU38xjNnc3nIOmQh5u+rM4cqBucJGFiWUrAZVAr6Cl
	3pGh37qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdXD-00000004AFF-2dFm;
	Tue, 27 Oct 2026 09:31:59 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdX8-00000004ADG-2ekE
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 09:31:58 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2e934c6c1c8so15468545ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093514; x=1793698314; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0lp8ix384KyuQihbhJDejl7Hsm+NKly5D1mQFcd+Ymw=;
        b=M7Zm5MxWeesTEcO6B+8NIf+pT/vKqO+89AICqPuZpPkdFcbkZXGxesGL+TaKLSNyIf
         VtiI+2iWXIu/q9TyQNF08PSvToV/u2APC/GYoEtN1sqS/aFt+z/LTRQjEIss2+PGLPe2
         sFjWBqN0vRLy8Ah3b2veveH5SR0/IB4jpiQ0DIDveqfVXuZln24vUcHdlN3VUaFtKui9
         jNLONqNLeZ4taNAYPc0t2HcXQaQ0OrXeNDurEfP+RjxO1eYXafVtWEVDS6EmPB1GvXpp
         4icRhjeAzL3fLkXDxMC+Bxqa1Abdl32UxGeQBfXn0gBiHsbC68SdgcX7vrv88emPjzJC
         PKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093514; x=1793698314;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lp8ix384KyuQihbhJDejl7Hsm+NKly5D1mQFcd+Ymw=;
        b=AJzP9D2rONw17Z3P5FUm3be5mZH+8uDt3QeQGwnXMUro/tPOc9LM/r/vRcx4y9S1s/
         gY3qVDdHghqqN09WhlB7zErwSyx4AVIpVBejVevypSCJ9FmSLn8a2EGmU3WAeeLMyReY
         4DnBry2zvmfrJbzJNod8ADlMrdRzdjh33mLgyuoofTp6NUFW9weK9iHe18+CNpIYxVvN
         RybP+Shbq9dh1QX2SSij7TMF9hrr7HCoIkc4ioP/xJSr7w1qSAiliUehNQiXxspi7sLW
         XVy/nPfF4jpQvFybrf8M7Uv30kXsX5BrulyC2cWk5wJmrsdSjHktVgsqMIK/XNkB9omV
         amMg==
X-Forwarded-Encrypted: i=1; AKwUvBy/fX/rN6mgCdDKQxa7u/A/6ogdvrJw8HIzlNfFoiZggyvy18mVWUu0APQZ8kx4qbBJS6adOscaM7Q4q9pc@lists.infradead.org
X-Gm-Message-State: AFq9FYKDMKs0n+uTiyJvjeK9DwDdP0gWwjQWNN8VT2zV/+51U6Im0izG
	+ksNI95qpyfLqcgtWFzaEU5gnhgKqESy8PbOXiXXI48N28M0zCoQVsbN
X-Gm-Gg: AYBFou3BBS7jbNc3qYn3iEVtNnOSZv8Y7YsGAFw8rtMa51nXOSSqacqb5h0Y58MouQw
	qhrcXeGodcA+PYPj9xeV9xMdJXePyiZqKlMGEmTMax+CdSLjHFL1SdjCHqSe+fPkKeN6vUvB1aV
	IxQpdYBHJrTtPhsuyoofLG2i98noK/2EjN1UDm2+8LXZ16FbyGR/VPN++klrW/g2pLFCWmA/YU2
	eT3liKQtMt1GzJlrk5X47BmZ4Kacphr+4FuFFAagT8zps0YftmRAIBAXJAp0cc+JfCRp6H+qxGS
	cwR7zRJ7fBXQ0RzMxdsIsCpEhjHKTk4+lSze9mCy+jlJyicI+CnyDU96OoYxFbE4AtBRN0zQLh8
	61m73ENYPVeRv82marmb50YGqgPVMqaNIK6L7vAaqohnb3shWkGhLLPxFGnuNC6CZEtDuNFktGa
	l7FufNt3dg+VTAE/hKN6s2pSvcc+UiDQnZcMMPa9Xx0A11Uhrmm9nrLB41Kv2NIlrdXJeLNQFTJ
	hF02eHHfV2IuzCRc1C8kkG56jxC9v5kouMWzPHft1SFhPFz4QHsJ2jWb0JoI952EAx/CHx+3dwm
X-Received: by 2002:a17:903:3c6c:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2ea9c03f2ffmr86182255ad.8.1793093513672;
        Tue, 27 Oct 2026 02:31:53 -0700 (PDT)
Received: from [0.0.0.0] ([129.126.71.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm6281855ad.58.2026.10.27.02.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:31:52 -0700 (PDT)
Message-ID: <e9764219-8afc-4e8b-985f-9611b0c9a28f@gmail.com>
Date: Tue, 27 Oct 2026 17:31:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, rafael@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu686@gmail.com>
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_023154_678331_B0050E72 
X-CRM114-Status: GOOD (  17.54  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSmVyb21lLAoKT24gMTAvMjYvMjAyNiA0OjU3IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+
IE9uIGx1bi4gMjYgb2N0LiAyMDI2IGF0IDExOjAwLCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1h
ckBsaW5hcm8ub3JnPiB3cm90ZToKPiAKPj4gT24gMjUtMTAtMjYsIDIwOjIyLCBjaHJpc3RpYW4u
a29ldmVyLWRyYXhsQHN0dWRlbnQudWliay5hYy5hdCB3cm90ZToKPj4+IEZyb206IENocmlzdGlh
biBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgo+Pj4KPj4+IEV2ZXJ5
IFM0IHNwZWVkIGJpbiBydW5zIHRoZSBzYW1lIENQVSBmcmVxdWVuY2llcyBidXQgbmVlZHMgaXRz
IG93bgo+Pj4gdm9sdGFnZSBjdXJ2ZSwgYW5kIHRoZSBiaW4gY2FuIG9ubHkgYmUgcmVhZCB0aHJv
dWdoIHRoZSBzZWN1cmUgbW9uaXRvci4KPj4+Cj4+PiBSZWFkIHRoZSBiaW4gZnJvbSB0aGUgZmly
bXdhcmUsIHNlbGVjdCB0aGUgbWF0Y2hpbmcKPj4+ICJvcHAtbWljcm92b2x0LXNwZWVkPGJpbj4i
IHByb3BlcnR5IGZvciBhbGwgQ1BVcywgdGhlbiByZWdpc3Rlcgo+Pj4gY3B1ZnJlcS1kdC4gQmlu
cyBvdXRzaWRlIHRoZSBrbm93biByYW5nZSBmYWxsIGJhY2sgdG8gYmluIDAsIHdoaWNoCj4+PiBo
YXMgdGhlIGhpZ2hlc3Qgdm9sdGFnZXMuIExpa2Ugc3VuNTBpLWNwdWZyZXEtbnZtZW0sIHRoZSBk
cml2ZXIgYmluZHMKPj4+IG9uIHRoZSBTb0MgY29tcGF0aWJsZSBhbmQgbmVlZHMgbm8gbm9kZSBv
ZiBpdHMgb3duLCBhbmQgUzQgaXMgYWRkZWQgdG8KPj4+IHRoZSBjcHVmcmVxLWR0LXBsYXRkZXYg
YmxvY2tsaXN0IHNvIGNwdWZyZXEtZHQgaXMgb25seSBjcmVhdGVkIGFmdGVyCj4+PiB0aGUgYmlu
IGhhcyBiZWVuIGFwcGxpZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4+PiAtLS0KPj4+ICAgTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPj4+ICAgZHJpdmVycy9jcHVm
cmVxL0tjb25maWcuYXJtICAgICAgICAgIHwgIDE0ICsrCj4+PiAgIGRyaXZlcnMvY3B1ZnJlcS9N
YWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArCj4+PiAgIGRyaXZlcnMvY3B1ZnJlcS9hbWxvZ2lj
LWNwdWZyZXEuYyAgICB8IDE4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICAgZHJp
dmVycy9jcHVmcmVxL2NwdWZyZXEtZHQtcGxhdGRldi5jIHwgICAyICsKPj4+ICAgNSBmaWxlcyBj
aGFuZ2VkLCAyMDIgaW5zZXJ0aW9ucygrKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9jcHVmcmVxL2FtbG9naWMtY3B1ZnJlcS5jCj4+Cj4+IElzIGl0IHNhZmUgdG8gYXBwbHkganVz
dCB0aGlzIG9uZSA/IEkgY2FuIHRha2UgdGhpcyB2aWEgdGhlIFBNIHRyZWUgdGhlbi4KPiAKPiBJ
IHdvdWxkIGFkdmlzZSB0byB3YWl0IGEgbGl0dGxlIGZvciBBbWxvZ2ljIHRvIGNoaW1lIGluLj4K
PiBQYXRjaCAyIGlzIHNvbWV0aGluZyBJIGFscmVhZHkgcmVqZWN0ZWQgYmFjayB3aGVuIFM0IHN1
cHBvcnQgd2FzCj4gaW5pdGlhbGx5IGludHJvZHVjZWQuIEkgc3VwcG9zZSBBSSBqdXN0IHVuZWFy
dGhlZCBpdCBhbmQgZGlkIG5vdCBib3RoZXIKPiB0byBtZW50aW9uIGl0Lgo+IAo+IEFtbG9naWMg
d2FzIHN1cHBvc2VkIHRvIG1pZ3JhdGUgdG8gU0NNSSBhdCB0aGF0IHBvaW50LCBhbmQgcG9zc2li
bHkKPiBoYW5kbGUgQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nIHRocm91Z2ggdGhlIHNlY3VyZSBmdyBl
bnRpcmVseS4KClllcywgc3RhcnRpbmcgZnJvbSB0aGUgQzMgY2xvY2sgdXBzdHJlYW0gc3VibWlz
c2lvbiwgd2UgcmVwbGFjZWQgdGhlIApTTUNzIGltcGxlbWVudGF0aW9uIG9mIHRoZSBzZWN1cmUt
Y2xvY2sgd2l0aCBTQ01JLiBGb3IgdGhlIGxhdGVzdCAKcmVsZWFzZWQgQW1sb2dpYyBTb0NzIChT
NyBhbmQgbGF0ZXIpLCBzZWN1cmUtY2xvY2sgaXMgaW1wbGVtZW50ZWQgCnVuaWZvcm1seSB0aHJv
dWdoIFNDTUkuCgo+IAo+IFRoZXkgZGlkIG9uIGxhdGVyIFNvQ3MsIEkgZG9uJ3Qga25vdyB3aGVy
ZSB0aGVpciBGVyBzdGFuZHMgb24gdGhlIFM0LgoKTW9zdCBTNCBjdXN0b21lcnMgcmVjZWl2ZSBh
IHNlY3VyZSBmaXJtd2FyZSAoYmwzMS5iaW4pIHRoYXQgc2V0cyAKc2VjdXJlLWNsb2NrIHZpYSBT
TUNzIChiZWNhdXNlIHRoZSBTNCBTREsgaGFkIGFscmVhZHkgYmVlbiByZWxlYXNlZCBieSAKdGhl
IHRpbWUgd2UgYWRkZWQgU0NNSSBzdXBwb3J0KS4gV2UgaGF2ZSBhbHNvIHByb3ZpZGVkIGFuIFND
TUktY2FwYWJsZSAKYmwzMS5iaW4gdG8gc29tZSBjdXN0b21lcnMuCgo+IAo+Pgo+PiAtLSAKPj4g
dmlyZXNoCj4gCgotLSAKQmVzdCByZWdhcmRzLApDaHVhbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

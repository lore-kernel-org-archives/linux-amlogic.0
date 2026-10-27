Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA4606A31A
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=If2cAmJJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWtzPTNz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H0IifAVDLS7/cZ/qYy1iNEWFVdHjBO41EbkKRy3JwO0=; b=If2cAmJJy2ZaeASpwUJuIdHykr
	9fNvL7hXXWrtxs6UtvnaLYHUCL7tvSybKZOD64K+M8bDrRSEwBYtiz8ZqE1NYVMMGBARwCSrIpZKS
	FAUih7FzpW0u0cvmGy3lRlG+CQHNgpcwHbggwJZUJQyETSJMyYc8Q2UfiNWDBECxci1yG1FykHcCF
	WVfkHTaT0EnkKVAn1yArbyKlWLo+s1AZWpm5XUMwsbZ1+8naxmO8WFkyJRu9o1d9R677qHwtvc7Y7
	snvmttrlY80f8sKA1MTSh9zNcJwXtDQ1mtBCV3mBtjaAOfsbHy+W5n3N5HUzDGH8BxlUCqskHxafg
	ctIb6E2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdSV-000000049hL-37xo;
	Tue, 27 Oct 2026 09:27:07 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdSS-000000049gY-2ye7
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 09:27:06 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2e85fb35300so5213865ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093223; x=1793698023; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h4/IEEwDZXLw/hZQAesBTnBi16Rhs6f/cohcUh8FEIY=;
        b=rWtzPTNzVG39x9kMIdVu5SBwReZC/oUyysBQxhb9589aQruru8CUFssOMFX16DRwjL
         pTgEV06To9H7CeWMGE+4IuzctbMcUC2/G8iy8MKGDClD6yQz7/91vOb1xhnEZbl1NKHA
         HQrHdBVwTSYshMJdbmL+UB66hoOAlnEfUTTvLWYcfJOQlfEBB/Fovym4/8KsqTJMIEG6
         oj0Fkaw43P9d0m2lRCpyLWAVp/V9IDCAodOwD2d5RobUqu455ghRuX1pZwO47LW7HV6F
         WBcDPFFyh9yLY/1QQ1FHGU567E0aZkjEdD/9oFjZlMWfm/kTVaU5RxmnEt+S2zVzJZdt
         INHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093223; x=1793698023;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4/IEEwDZXLw/hZQAesBTnBi16Rhs6f/cohcUh8FEIY=;
        b=AWmufWa/eu5RBw4BhEJP9nTTt1GGiWu9kXJc0nt80xfbogBNbtr99kQfH0700ICJA1
         2mEt7QcWX5W4LJOG5H0/2TIgXbAvElAbEzMo+AS1Zq2fxfc6aB8VDggshG/wHCO0lFsS
         oEokLyHUlRyB6jD3nhEQ6a7O7lm2kmJS3md93Kl/Lqu1mAiFOG7tKdS7KO7Um+twqUht
         5rwUz8lsEHRicNe5f1M4bLz3CF4apbJ9f+xSYl23HoXJH475SPX9Aikd0fMrFdBpjuIr
         lriVb3BEiIwesRTlPFLmJs4rzf5PF1EqczbcMokwj5ikuA4j5GkrLo8uafDJx5l7GBPF
         5rHw==
X-Forwarded-Encrypted: i=1; AKwUvBy3Amrhqw2o+GlT7wAtRCLga/ZAfE1YM/1Pai6Q53dXNj6sAD4sICi80XBAsYxt3FFFKo9Rs0R+32GOAYu4@lists.infradead.org
X-Gm-Message-State: AFq9FYKySF2J+L5V+VoQSiUedd64CFkhWsOPHChDZsFFn3lo19NyE6i/
	PD+99YtlDWEUIepJtZe/Nx0NzU66hiQSDlN+AErW0c9Lu/wBSJbRX8DX
X-Gm-Gg: AYBFou1VJYsRfOiT4iGkg8lvwn3xDxFPkNF1Oyb5QdY/wf3q6ne32GFkqSjFdb1JlKx
	GRw+3B7uDd3fRjVhuCwUaUaltivRuh7a6R2tfLBHPydLq9SLJyW5YuLLAPjzLVCY4iNg3caYN4u
	7J2mJvtZy4I0HKZhEaPjeec4TpLUKMNBPyo/nIncf1cTE0wUXnhMtehPq6Wg05fWHFsXdCP4GH0
	wQs6QvLpbiXeEJvwHLaEwrHPu2qNHww00F2Q2QXoxACDO2+ZsCz4McT4VdIam/Hy1iAcIYZOdEr
	196+iOP1owxlZz1MW0Kdu4IwvFcvUAWacKTeFgGRt+Hb3rCadNgrZKaN2YPmLal7uA+M4SfvVb3
	RcA2wg/h5gonDkRJvjeDer08zSF/jWpNhyMwlxMNzskAeWppn8PK/V/mj1FCp99wM0UhAKi0NDQ
	ZQwCPHKLYjRxFbpH0v7wCaEh3ZJlneRXXMeJ30fgMuYEnCIg0Cs5bK2HHoCwzPKzBHXQGtdRhNv
	uMI+6CREYu3f1SjXTUPGW+0rg9TFy+SbLQm705DqexJ5NCYANwMhgVSyZ+hF5dFH6nVRfdTww54
	yO2rMHKC7mO8LMz5A+zqbSt9ef7D
X-Received: by 2002:a17:903:19f0:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eae3942024mr14409105ad.9.1793093222853;
        Tue, 27 Oct 2026 02:27:02 -0700 (PDT)
Received: from [0.0.0.0] ([129.126.71.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm6149335ad.16.2026.10.27.02.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:26:59 -0700 (PDT)
Message-ID: <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
Date: Tue, 27 Oct 2026 17:26:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, rafael@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Drax?=
 =?UTF-8?Q?l?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
From: Chuan Liu <chuan.liu686@gmail.com>
In-Reply-To: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_022704_745144_312CB853 
X-CRM114-Status: GOOD (  16.20  )
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

SGkgVmlyZXNoLCBDaHJpc3RpYW4sCiAgICAgQ291bGQgeW91IHBsZWFzZSBob2xkIG9mZiBmb3Ig
bm93IG9uIHRoZSBwYXRjaGVzIGFkZGluZyBjcHVmcmVxIApkcml2ZXIgc3VwcG9ydCBvbiBTND8g
VGhlcmUgYXJlIHN0aWxsIHR3byBpc3N1ZXMgdGhhdCBuZWVkIHRvIGJlIApyZXNvbHZlZCBmaXJz
dDoKICAgLSBUaGUgY2xvY2sgZHJpdmVyIGN1cnJlbnRseSBkb2VzIG5vdCBzdXBwb3J0IHNldHRp
bmcgdGhlIENQVSBjbG9jay4KICAgLSBUaGUgQ1BVIHJlZ3VsYXRvciBuZWVkcyBzb21lIHRpbWUg
dG8gc3RhYmlsaXplIGFmdGVyIHRoZSB2b2x0YWdlIGlzIApjaGFuZ2VkLiBXaXRob3V0IGEgcHJv
cGVyIGRlbGF5LCB0aGUgQ1BVIGNsb2NrIGZyZXF1ZW5jeSBtYXkgYmUgcmFpc2VkIApiZWZvcmUg
dGhlIHJlZ3VsYXRvciB2b2x0YWdlIGhhcyBhY3R1YWxseSByZWFjaGVkIHRoZSB0YXJnZXQgdmFs
dWUsIAp3aGljaCBjYW4gaGFuZyB0aGUgc3lzdGVtLiBUaGUgUzQgQ1BVIHJlZ3VsYXRvciBoYW5k
bGluZyBjdXJyZW50bHkgbGFja3MgCnRoZSBsb2dpYyB0byB3YWl0IGZvciB0aGUgcmVndWxhdG9y
IHZvbHRhZ2UgdG8gc2V0dGxlLCBzbyB0aGlzIHBhcnQgCm5lZWRzIHRvIGJlIGNvbXBsZXRlZCBm
aXJzdC4KCldlIGFyZSBjdXJyZW50bHkgd29ya2luZyBvbiBzdWJtaXR0aW5nIG91ciBvd24gY3B1
ZnJlcSBkcml2ZXIuIFdlIGFyZSAKY29uc2lkZXJpbmcgaG93IHRvIGFkZHJlc3MgdGhlIGlzc3Vl
cyBhYm92ZSwgdGFraW5nIGludG8gYWNjb3VudCB0aGUgCmhhcmR3YXJlIGNoYXJhY3RlcmlzdGlj
cyBvZiBwcmV2aW91cyBTb0NzIGFuZCBldmFsdWF0aW5nIGZhY3RvcnMgc3VjaCBhcyAKdGhlIHRy
YW5zaXRpb24gbGF0ZW5jeS4gUzQgd2lsbCBiZSBjb3ZlcmVkIGJ5IHRoYXQgd29yayAoYXMgd2Vs
bCBhcyBTb0NzIApmcm9tIFM0IG9ud2FyZCwgc3VjaCBhcyBDMywgVDcsIC4uLiwgQTkpLiBTbyBw
bGVhc2UgZ2l2ZSB1cyBzb21lIHRpbWUuCgpPbiAxMC8yNi8yMDI2IDQ6NTkgUE0sIFZpcmVzaCBL
dW1hciB3cm90ZToKPiBPbiAyNi0xMC0yNiwgMDk6NTcsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+
IE9uIGx1bi4gMjYgb2N0LiAyMDI2IGF0IDExOjAwLCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1h
ckBsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4+IE9uIDI1LTEwLTI2LCAyMDoyMiwgY2hyaXN0aWFu
LmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4+Pj4gRnJvbTogQ2hyaXN0
aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4+Pj4KPj4+PiBF
dmVyeSBTNCBzcGVlZCBiaW4gcnVucyB0aGUgc2FtZSBDUFUgZnJlcXVlbmNpZXMgYnV0IG5lZWRz
IGl0cyBvd24KPj4+PiB2b2x0YWdlIGN1cnZlLCBhbmQgdGhlIGJpbiBjYW4gb25seSBiZSByZWFk
IHRocm91Z2ggdGhlIHNlY3VyZSBtb25pdG9yLgo+Pj4+Cj4+Pj4gUmVhZCB0aGUgYmluIGZyb20g
dGhlIGZpcm13YXJlLCBzZWxlY3QgdGhlIG1hdGNoaW5nCj4+Pj4gIm9wcC1taWNyb3ZvbHQtc3Bl
ZWQ8YmluPiIgcHJvcGVydHkgZm9yIGFsbCBDUFVzLCB0aGVuIHJlZ2lzdGVyCj4+Pj4gY3B1ZnJl
cS1kdC4gQmlucyBvdXRzaWRlIHRoZSBrbm93biByYW5nZSBmYWxsIGJhY2sgdG8gYmluIDAsIHdo
aWNoCj4+Pj4gaGFzIHRoZSBoaWdoZXN0IHZvbHRhZ2VzLiBMaWtlIHN1bjUwaS1jcHVmcmVxLW52
bWVtLCB0aGUgZHJpdmVyIGJpbmRzCj4+Pj4gb24gdGhlIFNvQyBjb21wYXRpYmxlIGFuZCBuZWVk
cyBubyBub2RlIG9mIGl0cyBvd24sIGFuZCBTNCBpcyBhZGRlZCB0bwo+Pj4+IHRoZSBjcHVmcmVx
LWR0LXBsYXRkZXYgYmxvY2tsaXN0IHNvIGNwdWZyZXEtZHQgaXMgb25seSBjcmVhdGVkIGFmdGVy
Cj4+Pj4gdGhlIGJpbiBoYXMgYmVlbiBhcHBsaWVkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4+Pj4g
LS0tCj4+Pj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+
Pj4+ICAgZHJpdmVycy9jcHVmcmVxL0tjb25maWcuYXJtICAgICAgICAgIHwgIDE0ICsrCj4+Pj4g
ICBkcml2ZXJzL2NwdWZyZXEvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDEgKwo+Pj4+ICAgZHJp
dmVycy9jcHVmcmVxL2FtbG9naWMtY3B1ZnJlcS5jICAgIHwgMTg0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+Pj4+ICAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEtZHQtcGxhdGRldi5jIHwg
ICAyICsKPj4+PiAgIDUgZmlsZXMgY2hhbmdlZCwgMjAyIGluc2VydGlvbnMoKykKPj4+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2NwdWZyZXEvYW1sb2dpYy1jcHVmcmVxLmMKPj4+Cj4+
PiBJcyBpdCBzYWZlIHRvIGFwcGx5IGp1c3QgdGhpcyBvbmUgPyBJIGNhbiB0YWtlIHRoaXMgdmlh
IHRoZSBQTSB0cmVlIHRoZW4uCj4+Cj4+IEkgd291bGQgYWR2aXNlIHRvIHdhaXQgYSBsaXR0bGUg
Zm9yIEFtbG9naWMgdG8gY2hpbWUgaW4uCj4gCj4gU3VyZSwgSSB3YXNuJ3QgZ29pbmcgdG8gd2Fp
dCBmb3IgdGhlIG1haW50YWluZXJzIHRvIHJlc3BvbmQgYW55d2F5Lgo+IAoKLS0gCkJlc3QgcmVn
YXJkcywKQ2h1YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==

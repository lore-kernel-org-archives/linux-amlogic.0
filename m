Return-Path: <SRS0=gjj1=XY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCE1C4360C
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2019 01:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E5362082F
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2019 01:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qmQ8BLle";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U79lQ5AE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E5362082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kyXXzvuIGaf97F21Ieg6vHnXlTKwHGtYfmCBcNjQ+Bw=; b=qmQ8BLleRdR44WkXQuT0hh6IS
	udG8Y0gFruegVpoAOv7ets2uHqAGAiG/TyXZLK1E3DQ4d8riewo7WHNmFulrNqNXx85zIYTGc4/cQ
	tWpQKFTN9JYVZ6Lkl5s71qmU1LozO4gVJwjYexdCGy/ug5of2TJP1aLgHqBBdUXMc62Zfl9thSQKh
	/gRnk6m7j82jlSQcrjUCIcmtRGyHvsJkk6aKiPOWMAvfcMbT3qBnqLuqDEosQRlRitWbzyi8NCTUD
	Y6Xs1pin7WqGU0uZX5YnQBfLsyTOho6vQCNX9oSZ+At1BAzIx3kISWT5gUlH9lZsv4jI0wtwLUUZh
	egW1Os/Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEO9E-0006IY-NA; Sun, 29 Sep 2019 01:37:16 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEO9C-0006Hl-5k
 for linux-amlogic@lists.infradead.org; Sun, 29 Sep 2019 01:37:15 +0000
Received: by mail-ot1-x336.google.com with SMTP id s22so5472138otr.6
 for <linux-amlogic@lists.infradead.org>; Sat, 28 Sep 2019 18:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=LijraxTx8ikOVi3R9AzXwD4zHpWFSZTg8TgsKo0PXWI=;
 b=U79lQ5AEE+NJ8rq507OiAgFJ7onIhEeBQuSRWRLl5Ib7T+oNx5WJuK4x6K9srTe+au
 tlEXl+pHK9WsgDAD2sNIpplLxVuDlK+ITu+O9dtO/1fQBMT/YdLTUURTUq/4HlxdLd7q
 HRmoGW1YH3aTnQkxsobDRRw+JLvg7unbuEiiAeUELImfT1u5t6zyE+23f40esXvWZBCC
 tHvr3FQoSb8Gya6nlvEy9IXHGf2LPbX6yWZ+eZOEHRLryKd9a0ZLaImRvQYo5VIgoxZh
 mkeh1AbOBfRtwAruxav2NM9e2+dKtShoS9cgZBFDkuwO2ujfMQCQ9IU3UIfoNioVuHtr
 65TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=LijraxTx8ikOVi3R9AzXwD4zHpWFSZTg8TgsKo0PXWI=;
 b=CIQAseY/I9rpMmRak2vXWle/2WHd9iZL1r0lofVKcb0wkX8KHStVhCH+U1Vtxh2KIf
 7wtOyu2OxJv1ZVTSMIWjrs2NSKqhRNKSB9e9Sy1JETP4GpBGfh8iY7tkx4oE2imripki
 cZFv25gjsKSh9as55XQGFgEMrC9Mf2w8CUyKd78a91pcQtip0SoiccGVHdzGTM+PAduN
 MVqFKIOd0cS8oujuV9BG6OPxVUm4jCyWzP3b8IgG7NY3kZMmnlpassOAQ3yHmmHg8tyM
 l4v4YjWjKW0kvhl+9sTo39oSggqBE04PDDfqMKkuiz61hc+JJ2P7mVefXXlHkYnTzSRx
 6cRw==
X-Gm-Message-State: APjAAAXnvb5fBfS4yO50hVM787wK9ZAPfwS06+lbEdWjmYP1l8NYx1eR
 hM75oNSDuSI4R3Zaffrgb5cYRgFk/OiKGDmifoq0OA==
X-Google-Smtp-Source: APXvYqwcdAtKmFWrcXSUUXe73AbGgdQ5bkCuDbYC+iNXHifzucVGPZovIWNTMl5ohQPXyPIAadIrICYepjn1W/eIul8=
X-Received: by 2002:a9d:5c88:: with SMTP id a8mr8529941oti.276.1569721029617; 
 Sat, 28 Sep 2019 18:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <d6322351-6a84-e123-d84c-c61e1a1b1d1f@baylibre.com>
 <20190927132542.1841-1-narmstrong@baylibre.com>
 <CA+3zgmvmXwrXjM_xPZuumUhOEjqFqv7WofXGLDvY0S5JedN4Wg@mail.gmail.com>
In-Reply-To: <CA+3zgmvmXwrXjM_xPZuumUhOEjqFqv7WofXGLDvY0S5JedN4Wg@mail.gmail.com>
From: Tim <elatllat@gmail.com>
Date: Sat, 28 Sep 2019 21:36:58 -0400
Message-ID: <CA+3zgmtoSDFfuJLeM4VCR+m80ZEmokNjVh=0eUO3=C7yOa92dg@mail.gmail.com>
Subject: Fwd: [PATCH] dwc3: add parkmode_disable_ss_quirk for G12A
To: linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="0000000000005e08a10593a72895"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190928_183714_240702_4861A712 
X-CRM114-Status: GOOD (  10.69  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--0000000000005e08a10593a72895
Content-Type: text/plain; charset="UTF-8"

Text only version for the list;

---------- Forwarded message ---------
From: Tim <elatllat@gmail.com>
Date: Sat, Sep 28, 2019 at 9:25 PM
Subject: Re: [PATCH] dwc3: add parkmode_disable_ss_quirk for G12A
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: tobetter <tobetter@gmail.com>, Neil Armstrong
<narmstrong@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>


Thanks, yes that works.

Details;
I applied the patch to the v5.3.1 tag (diff attached), and built 3
kernels for testing.

v5.3.1 errors in seconds
v5.3.1_tobetter no errors
v5.3.1_neil no errors

The test is a rsync of a small database (24GB 2000 files) from a
remote server to a local spinning disk/lvm_devices=3/cryptsetup/ext4.
I also tested a simpler case and got no errors on any of the 3 builds
with local only rsync on spinning disk/mdadm_level=0_devices=2/ext4,
so either the network or storage stack are required to reproduce this
bug.

--0000000000005e08a10593a72895
Content-Type: application/x-patch; name="park.patch"
Content-Disposition: attachment; filename="park.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k12zatav0>
X-Attachment-Id: f_k12zatav0

ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0CmluZGV4
IDY2NzgwYTQ3YS4uYzk3N2EzYmEyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2IvZHdjMy50eHQKQEAgLTc1LDYgKzc1LDggQEAgT3B0aW9uYWwgcHJvcGVydGll
czoKIAkJCWZyb20gUDAgdG8gUDEvUDIvUDMgd2l0aG91dCBkZWxheS4KICAtIHNucHMsZGlzLXR4
LWlwZ2FwLWxpbmVjaGVjay1xdWlyazogd2hlbiBzZXQsIGRpc2FibGUgdTJtYWMgbGluZXN0YXRl
IGNoZWNrCiAJCQlkdXJpbmcgSFMgdHJhbnNtaXQuCisgLSBzbnBzLHBhcmttb2RlLWRpc2FibGUt
c3MtcXVpcms6IHdoZW4gc2V0LCBhbGwgU3VwZXJTcGVlZCBidXMgaW5zdGFuY2VzIGluCisJCQlw
YXJrIG1vZGUgYXJlIGRpc2FibGVkLgogIC0gc25wcyxkaXNfbWV0YXN0YWJpbGl0eV9xdWlyazog
d2hlbiBzZXQsIGRpc2FibGUgbWV0YXN0YWJpbGl0eSB3b3JrYXJvdW5kLgogCQkJQ0FVVElPTjog
dXNlIG9ubHkgaWYgeW91IGFyZSBhYnNvbHV0ZWx5IHN1cmUgb2YgaXQuCiAgLSBzbnBzLGlzLXV0
bWktbDEtc3VzcGVuZDogdHJ1ZSB3aGVuIERXQzMgYXNzZXJ0cyBvdXRwdXQgc2lnbmFsCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYS5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEuZHRzaQppbmRleCAxNzg1NTUyZDQu
LjFmMzBiNWYyNiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWcxMmEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYS5k
dHNpCkBAIC0yNDAwLDYgKzI0MDAsNyBAQAogCQkJCWRyX21vZGUgPSAiaG9zdCI7CiAJCQkJc25w
cyxkaXNfdTJfc3VzcGh5X3F1aXJrOwogCQkJCXNucHMscXVpcmstZnJhbWUtbGVuZ3RoLWFkanVz
dG1lbnQ7CisJCQkJc25wcyxwYXJrbW9kZS1kaXNhYmxlLXNzLXF1aXJrOwogCQkJfTsKIAkJfTsK
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYwppbmRleCBjOWJiOTNhMmMuLmY2NGRiYTE3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMKKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMKQEAgLTk4Myw2ICs5
ODMsOSBAQCBzdGF0aWMgaW50IGR3YzNfY29yZV9pbml0KHN0cnVjdCBkd2MzICpkd2MpCiAJCWlm
IChkd2MtPmRpc190eF9pcGdhcF9saW5lY2hlY2tfcXVpcmspCiAJCQlyZWcgfD0gRFdDM19HVUNU
TDFfVFhfSVBHQVBfTElORUNIRUNLX0RJUzsKIAorCQlpZiAoZHdjLT5wYXJrbW9kZV9kaXNhYmxl
X3NzX3F1aXJrKQorCQkJcmVnIHw9IERXQzNfR1VDVEwxX1BBUktNT0RFX0RJU0FCTEVfU1M7CisK
IAkJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dVQ1RMMSwgcmVnKTsKIAl9CiAKQEAgLTEy
OTQsNiArMTI5Nyw4IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2V0X3Byb3BlcnRpZXMoc3RydWN0IGR3
YzMgKmR3YykKIAkJCQkic25wcyxkaXMtZGVsLXBoeS1wb3dlci1jaGctcXVpcmsiKTsKIAlkd2Mt
PmRpc190eF9pcGdhcF9saW5lY2hlY2tfcXVpcmsgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29s
KGRldiwKIAkJCQkic25wcyxkaXMtdHgtaXBnYXAtbGluZWNoZWNrLXF1aXJrIik7CisJZHdjLT5w
YXJrbW9kZV9kaXNhYmxlX3NzX3F1aXJrID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYs
CisJCQkJInNucHMscGFya21vZGUtZGlzYWJsZS1zcy1xdWlyayIpOwogCiAJZHdjLT50eF9kZV9l
bXBoYXNpc19xdWlyayA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LAogCQkJCSJzbnBz
LHR4X2RlX2VtcGhhc2lzX3F1aXJrIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oCmluZGV4IDNkZDc4M2I4OC4uN2Y4NzdhYzM3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaAorKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuaApAQCAtMjQ5LDYgKzI0OSw3IEBACiAjZGVmaW5lIERXQzNfR1VDVExfSFNUSU5B
VVRPUkVUUlkJQklUKDE0KQogCiAvKiBHbG9iYWwgVXNlciBDb250cm9sIDEgUmVnaXN0ZXIgKi8K
KyNkZWZpbmUgRFdDM19HVUNUTDFfUEFSS01PREVfRElTQUJMRV9TUyAgICAgICAgIEJJVCgxNykK
ICNkZWZpbmUgRFdDM19HVUNUTDFfVFhfSVBHQVBfTElORUNIRUNLX0RJUwlCSVQoMjgpCiAjZGVm
aW5lIERXQzNfR1VDVEwxX0RFVl9MMV9FWElUX0JZX0hXCUJJVCgyNCkKIApAQCAtMTAyMiw2ICsx
MDIzLDggQEAgc3RydWN0IGR3YzNfc2NyYXRjaHBhZF9hcnJheSB7CiAgKgkJCWNoYW5nZSBxdWly
ay4KICAqIEBkaXNfdHhfaXBnYXBfbGluZWNoZWNrX3F1aXJrOiBzZXQgaWYgd2UgZGlzYWJsZSB1
Mm1hYyBsaW5lc3RhdGUKICAqCQkJY2hlY2sgZHVyaW5nIEhTIHRyYW5zbWl0LgorICogQHBhcmtt
b2RlX2Rpc2FibGVfc3NfcXVpcms6IHNldCBpZiB3ZSBuZWVkIHRvIGRpc2FibGUgYWxsIFN1cGVy
U3BlZWQKKyAqICAgICAgICAgICAgICAgICAgICAgaW5zdGFuY2VzIGluIHBhcmsgbW9kZS4KICAq
IEB0eF9kZV9lbXBoYXNpc19xdWlyazogc2V0IGlmIHdlIGVuYWJsZSBUeCBkZS1lbXBoYXNpcyBx
dWlyawogICogQHR4X2RlX2VtcGhhc2lzOiBUeCBkZS1lbXBoYXNpcyB2YWx1ZQogICogCTAJLSAt
NmRCIGRlLWVtcGhhc2lzCkBAIC0xMjExLDYgKzEyMTQsNyBAQCBzdHJ1Y3QgZHdjMyB7CiAJdW5z
aWduZWQJCWRpc191Ml9mcmVlY2xrX2V4aXN0c19xdWlyazoxOwogCXVuc2lnbmVkCQlkaXNfZGVs
X3BoeV9wb3dlcl9jaGdfcXVpcms6MTsKIAl1bnNpZ25lZAkJZGlzX3R4X2lwZ2FwX2xpbmVjaGVj
a19xdWlyazoxOworCXVuc2lnbmVkICAgICAgICAgICAgICAgIHBhcmttb2RlX2Rpc2FibGVfc3Nf
cXVpcms6MTsKIAogCXVuc2lnbmVkCQl0eF9kZV9lbXBoYXNpc19xdWlyazoxOwogCXVuc2lnbmVk
CQl0eF9kZV9lbXBoYXNpczoyOwo=
--0000000000005e08a10593a72895
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--0000000000005e08a10593a72895--

